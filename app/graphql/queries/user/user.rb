module Queries
  module User
    class User < BaseQuery
      type Types::Objects::UserType, null: false

      argument :id, ID, required: false

      def resolve(id: nil)
        ::UserDetail.find_by!(user_id: id || current_user.id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
