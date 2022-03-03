module Mutations
  module Product
    class CreateProduct < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :params, Types::Inputs::ProductInputType, required: true
      argument :image, ApolloUploadServer::Upload, required: true

      # rubocop:disable Mertrics/MethodLength, Mertics/AbcSize
      def resolve(params:, image:)
        product = ::Product.create!(
          creator: current_user.creator,
          status: :active
        )
        product_info = product.create_product_info!(params.to_h)

        ActiveRecord::Base.transaction do
          new_image = ::Image.new
          new_image.image.attach(io: image.to_io, filename: image.original_filename)

          product.product_info.create_product_image!(image: new_image)
        end

        { product: product_info }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
      # rubocop:enable Mertrics/MethodLength, Mertics/AbcSize
    end
  end
end
