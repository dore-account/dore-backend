module Queries
  module Product
    class ProductsByUser < AuthCreatorQuery
      type [Types::Objects::ProductType], null: false

      def resolve
        current_creator.product_infos
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
