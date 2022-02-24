module Queries
  module PaymentMethod
    class SetupPaymentMethod < BaseQuery
      type Types::Objects::StripeType, null: false

      def resolve
        client_secret = StripeClient.register_card(current_user)

        { client_secret: client_secret }
      end
    end
  end
end
