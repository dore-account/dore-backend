module Queries
  module Purchase
    class AllPurchases < AuthQuery
      type [Types::Objects::PurchaseVideoType], null: false

      def resolve
        ::Purchase.where(user: current_user)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end

