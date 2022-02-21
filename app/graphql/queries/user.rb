module Queries
  class User < BaseQuery
    type Types::Objects::UserType, null: false

    def resolve
      UserDetail.find_by!(user: current_user)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Note does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
