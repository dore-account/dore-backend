module Mutations
  module Product
    class UploadProductImage < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :id, ID, required: true
      argument :image, ApolloUploadServer::Upload, required: true

      def resolve(id:, image:)
        product = ::ProductInfo.find_by(product_id: id)
        raise ActionController::BadRequest if product.nil?

        ActiveRecord::Base.transaction do
          new_image = ::Image.new
          new_image.image.attach(io: image.to_io, filename: image.original_filename)

          product.create_product_image!(image: new_image)
        end

        { product: product }
      end
    end
  end
end
