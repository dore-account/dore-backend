module Types
  module Objects
    class PaymentMethodType < BaseObject
      field :id, String, null: false, description: 'payment_methodのid'
      field :brand, String, null: false, description: 'カードブランド'
      field :exp_month, Integer, null: false
      field :exp_year, String, null: false
    end
  end
end
