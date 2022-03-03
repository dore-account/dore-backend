module Mutations
  module User
    class UpdateUser < AuthMutation
      field :user, Types::Objects::UserType, null: false

      argument :params, Types::Inputs::UserInputType, required: true

      def resolve(params:)
        user_detail = ::UserDetail.find_or_initialize_by(user: current_user)
        user_detail.update!(params.to_h)

        { user: user_detail }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
