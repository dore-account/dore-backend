module Mutations
  module PaymentMethod
    class CreatePaymentMethod < AuthMutation
      field :client_secret, Types::Objects::StripeClientSecretType, null: false

      def resolve
        client_secret = StripeClient.register_card(current_user)

        { client_secret: client_secret }
      end
    end
  end
end
