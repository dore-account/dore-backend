module Mutations
  module User
    class UpdateInfo < BaseMutation
      field :user, Types::Objects::UserType, null: false

      argument :params, Types::Inputs::UserInfoInputType, required: false

      def resolve(params:)
        user_info = ::UserInfo.find_or_initialize_by(user: current_user)
        user_info.update!(stan: params.stan)

        { user: user_info.user.user_detail }

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end

