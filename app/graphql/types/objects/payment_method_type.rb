module Types
  module Objects
    class PaymentMethodType < BaseObject
      field :id, ID, null: false, description: 'payment_methodのid'
      field :provider, String, null: false, description: 'stripe_payment_methodのid'
      field :type, String, null: false, description: '支払い方法'
    end
  end
end
