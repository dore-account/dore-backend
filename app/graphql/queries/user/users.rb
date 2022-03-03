module Queries
  module User
    class Users < BaseQuery
      type [Types::Objects::UserType], null: false

      def resolve
        ::UserDetail.all
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
