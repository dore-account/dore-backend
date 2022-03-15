module Types
  module Objects
    class StripeUrlType < BaseObject
      field :url, String, null: false, description: 'stripe関連で返されるURL'
    end
  end
end
