module Mutations
  module User
    class DeleteUserImage < BaseMutation
      field :user, Types::Objects::UserType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        user = ::UserDetail.find_by(user: current_user)

        user.user_images.find_by(image_id: id).destroy!

        { user: user }
      end
    end
  end
end
