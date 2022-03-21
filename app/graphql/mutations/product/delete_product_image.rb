module Mutations
  module Product
    class DeleteProductImage < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        product_info = ::ProductInfo.find_by(product_id: id)

        product_info.product.product_image.destroy!

        { product: product_info }
      end
    end
  end
end
