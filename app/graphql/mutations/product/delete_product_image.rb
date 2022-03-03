module Mutations
  module Product
    class DeleteProductImage < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        product = ::ProductInfo.find_by(product_id: id)

        product.product_image.destroy!

        { product: product }
      end
    end
  end
end
