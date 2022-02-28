module Queries
  module Product
    class Product < BaseQuery
      type Types::Objects::ProductType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        ::ProductInfo.find_by!(product_id: id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
