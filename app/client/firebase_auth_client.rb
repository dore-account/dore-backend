class FirebaseAuthClient
  class << self
    def authenticate_user(token)
      raise 'Id token must be a String' unless token.is_a?(String)

      full_decoded_token = decode_jwt(token, false)
      errors = validate(full_decoded_token)
      raise errors.join(' / ') if errors.present?

      public_key = fetch_public_keys[full_decoded_token[:header]['kid']]
      unless public_key
        raise <<-ERROR.squish
          Firebase ID token has "kid" claim which does not correspond to a known public key.
          Most likely the ID token is expired, so get a fresh token from your client app and try again.
        ERROR
      end

      certificate = OpenSSL::X509::Certificate.new(public_key)
      decoded_token = decode_jwt(token, true, { algorithm: 'RS256', verify_iat: true }, certificate.public_key)

      User.find_or_create_by!(uid: decoded_token[:payload]['sub'], email: decoded_token[:payload]['email'])
    end


    # JWTをデコード
    def decode_jwt(token, key=nil, verify=false, options={})
      begin
        decoded_token = JWT.decode(token, key, verify, options)
      rescue JWT::ExpiredSignature => e
        raise 'Firebase ID token has expired. Get a fresh token from your client app and try again.'
      rescue => e
        raise "Firebase ID token has invalid signature. #{e.message}"
      end

      {
        payload: decoded_token[0],
        header: decoded_token[1]
      }
    end


    # トークン情報のフォーマットチェック
    def validate(json)
      errors = []
      # project_id = CONFIG['project_info']['project_id']
      payload = json[:payload]
      header = json[:header]
      # issuer = ISSUER_BASE_URL + project_id

      errors << 'Firebase ID token has no "kid" claim.' unless header['kid']
      unless header['alg'] == ALGORITHM
        errors << "Firebase ID token has incorrect algorithm. Expected '#{ALGORITHM}' but got '#{header['alg']}'"
      end
      # unless payload['aud'] == project_id
      #   errors << 'Firebase ID token has incorrect aud (audience) claim.' \
      #             "Expected'#{project_id}' but got '#{payload['aud']}'."
      # end
      # unless payload['iss'] == issuer
      #   errors << "Firebase ID token has incorrect 'iss' (issuer) claim." \
      #             "Expected '#{issuer}' but got '#{payload['iss']}'."
      # end
      errors << 'Firebase ID token has no "sub" (subject) claim.' unless payload['sub'].is_a?(String)
      errors << 'Firebase ID token has an empty string "sub" (subject) claim.' if payload['sub'].empty?
      errors << 'Firebase ID token has "sub" (subject) claim longer than 128 characters.' if payload['sub'].size > 128

      errors
    end


    # トークンが正しい鍵から作られているか確認する
    def fetch_public_keys
      # uri = URI.parse('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')

      # https = Net::HTTP.new(uri.host, uri.port)
      # https.use_ssl = true

      # res = https.start { https.get(uri.request_uri) }
      res = cached_connection.get('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')
      data = JSON.parse(res.body)

      return data unless data['error']

      msg = "Error fetching public keys for Google certs: #{data['error']} (#{res['error_description']})"
      raise msg
    end


    def cached_connection
      Faraday.new do |builder|
        builder.use :http_cache, store: Rails.cache, logger: Rails.logger
        builder.request :url_encoded
        builder.response :json, parser_options: { symbolize_names: true }, content_type: 'application/json'
        builder.adapter Faraday.default_adapter
      end
    end
  end
end