module Mutations
  module User
    class UploadUserImage < AuthMutation
      field :user, Types::Objects::UserType, null: false

      argument :image, ApolloUploadServer::Upload, required: true

      def resolve(image:)
        user = ::UserDetail.find_or_create_by(user: current_user)

        raise ActionController::BadRequest if user.nil?
        raise ActionController::BadRequest unless user.user_images.size < 7

        ActiveRecord::Base.transaction do
          new_image = ::Image.new
          new_image.image.attach(io: image.to_io, filename: image.original_filename)

          user.user_images.create!(image: new_image)
        end

        { user: user }
      end
    end
  end
end
