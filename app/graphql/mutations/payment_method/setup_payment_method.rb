module Mutations
  module PaymentMethod
    class SetupPaymentMethod < AuthMutation
      field :payment_method, Types::Objects::PaymentMethodType, null: false

      argument :params, Types::Inputs::PaymentMethodInputType, required: true

      def resolve(params:)
        payment_method = ::PaymentMethod.find_or_create_by(
          user: current_user,
          provider: params.provider,
          type: params.type
        )

        { payment_method: payment_method }
      end
    end
  end
end
