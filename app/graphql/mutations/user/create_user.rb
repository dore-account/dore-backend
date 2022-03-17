module Mutations
  module User
    class CreateUser < AuthMutation
      field :user, Types::Objects::UserType, null: false

      argument :params, Types::Inputs::UserInputType, required: true
      argument :images, [ApolloUploadServer::Upload], required: true

      # rubocop:disable Mertrics/MethodLength, Mertics/AbcSize
      def resolve(params:, images:)
        user_detail = ::UserDetail.find_or_initialize_by(user: current_user)
        user_detail.update!(params.to_h)

        ActiveRecord::Base.transaction do
          images.each do |image|
            new_image = ::Image.new
            new_image.image.attach(io: image.to_io, filename: image.original_filename)
            user_detail.user_images.create!(image: new_image)
          end
        end
        { user: user_detail }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
      # rubocop:enable Mertrics/MethodLength, Mertics/AbcSize
    end
  end
end
