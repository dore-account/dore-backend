module Types
  module Objects
    class ProductType < BaseObject
      field :id, ID, null: false, description: 'プロダクトID'
      field :name, String, null: false
      field :description, String, null: false
      field :price, Integer, null: false
      field :quantity, Integer, null: false
      field :status, Types::Enums::ProductStatus, null: false
      field :image, Types::Objects::ProductImageType, null: true

      def id
        object.product_id
      end

      def quantity
        object.product.product_inventory.quantity
      end

      def status
        object.product.status
      end

      def image
        object.product.product_image
      end
    end
  end
end
