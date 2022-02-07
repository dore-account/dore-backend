# frozen_string_literal: true

module FirebaseAuthConcern
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Token::ControllerMethods

  included do
    before_action :authenticate_user
  end

  private

  def authenticate_user
    authenticate_with_http_token do |token, _|
      @current_user = FirebaseAuthClient.authenticate_user(token)
    rescue StandardError => e
      p e
      @current_user = nil
    end
    { error: 'token invalid' }
  end

  def current_user
    @current_user
  end

  # def id_token
  #   request.headers['Authorization'].split.last
  # end
end