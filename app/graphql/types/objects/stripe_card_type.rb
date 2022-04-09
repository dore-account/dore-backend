module Types
  module Objects
    class StripeCardType < BaseObject
      field :id, String, null: false, description: 'stripe_payment_methodのid'
      field :brand, String, null: false, description: 'カードブランド'
      field :exp_month, Integer, null: false
      field :exp_year, Integer, null: false
      field :last4, String, null: false, description: 'カード番号の末4桁'
    end
  end
end
