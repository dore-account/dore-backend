module Mutations
  module Stripe
    class Connect < BaseMutation
      field :url, String, null: false

      def resolve
        { url: StripeClient.connect_stripe(current_creator) }
      end
    end
  end
end
