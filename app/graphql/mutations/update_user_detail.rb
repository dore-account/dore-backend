module Mutations
  class UpdateUserDetail < BaseMutation
    field :user, Types::UserType, null: false

    argument :id, ID, required: true
    argument :params, Types::Input::UserDetailInputType, required: true

    def resolve(id:, params:)
      user_detail_params = params.to_h
      # TODO: userに結びついているuserDetailを更新
      # user = User.find(id)
      user_detail = UserDetail.update(
        user_detail_params
      )

      { user: user_detail }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
