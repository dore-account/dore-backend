module Queries
  module PaymentMethod
    class PaymentMethods < BaseQuery
      type [Types::Objects::StripeCardType], null: false

      def resolve
        StripeClient.get_card_list(current_user)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
