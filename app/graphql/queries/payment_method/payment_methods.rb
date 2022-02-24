module Queries
  module PaymentMethod
    class PaymentMethods < BaseQuery
      type [Types::Objects::PaymentMethodType], null: false

      def resolve
        p current_user
        StripeClient.get_card_list(current_user)
      end
    end
  end
end

