module Queries
  module Purchase
    class Purchase < AuthQuery
      type Types::Objects::PurchaseVideoType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        ::Purchase.find_by!(id: id, user: current_user)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
