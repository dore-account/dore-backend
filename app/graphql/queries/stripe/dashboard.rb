module Queries
  module Stripe
    class Dashboard < BaseQuery
      type Types::Objects::StripeUrlType, null: false

      def resolve
        { url: StripeClient.dashboard(current_creator) }
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
