module Mutations
  class CreateUserDetail < BaseMutation
    field :user, Types::UserType, null: false

    argument :params, Types::Input::UserDetailInputType, required: true

    def resolve(params:)
      user_detail_params = Hash params
      
      user_detail = UserDetail.create(
        user_detail_params
      )

      { user: user_detail }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
