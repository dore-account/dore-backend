module Types
  module Objects
    class StripeType < BaseObject
      field :client_secret, String, null: false, description: 'クライアントに渡すkey'
    end
  end
end
