module Types
  module Objects
    class StripeClientSecretType < BaseObject
      field :client_secret, String, null: false, description: 'クライアントに渡すkey'
    end
  end
end
