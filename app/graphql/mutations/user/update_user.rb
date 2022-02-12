module Mutations
  module User
    class UpdateUser < BaseMutation
      field :user, Types::Objects::UserType, null: false

      argument :params, Types::Inputs::UserInputType, required: true

      def resolve(params:)
        user_detail_params = params.to_h

        user_detail = ::UserDetail.find_or_initialize_by(user: context[:current_user])

        user_detail.update!(
          user_detail_params
        )

        { user: user_detail }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
