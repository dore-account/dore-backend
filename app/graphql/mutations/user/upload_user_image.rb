module Mutations
  module User
    class UploadUserImage < BaseMutation
      field :user, Types::Objects::UserType, null: false

      argument :image, ApolloUploadServer::Upload, required: true

      def resolve(image:)
        user = UserDetail.find_by(user: current_user)

        raise ActionController::BadRequest unless user.user_images.size < 5

        ActiveRecord::Base.transaction do
          newImage = Image.new
          # ApolloUploadServer::Uploadをそのまま渡せないのでioとfilenameを渡す
          newImage.image.attach(io: image.to_io, filename: image.original_filename)

          user.user_images.create!(image: newImage)
        end

        { user: user }
      end
    end
  end
end