module Queries
  module Creator
    class Creator < BaseQuery
      type Types::Objects::CreatorType, null: false

      argument :id, ID, required: false

      def resolve(id:)
        ::Creator.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
