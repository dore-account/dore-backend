module Queries
  module Product
    class CurrentProducts < AuthCreatorQuery
      type [Types::Objects::ProductType], null: false

      def resolve
        # creator = ::Creator.find_by!(creator: current_creator)
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
