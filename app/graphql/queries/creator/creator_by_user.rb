module Queries
  module Creator
    class CreatorByUser < AuthQuery
      type Types::Objects::CreatorType, null: true

      def resolve
        user = ::UserDetail.find_by!(user: current_user)
        user.creator
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Note does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
