module Queries
  module Stripe
    class ConfirmConnect < BaseQuery
      type Types::Objects::StripeConfirmConnectType, null: false

      def resolve
        { is_completed: StripeClient.confirm_connect_account(current_creator) }
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
