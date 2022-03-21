module Types
  module Objects
    class ProductType < BaseObject
      field :id, ID, null: false, description: 'プロダクトID'
      field :name, String, null: false
      field :description, String, null: false
      field :price, Integer, null: false
      field :stock_quantity, Integer, null: false
      field :status, Types::Enums::ProductStatus, null: false
      field :image, Types::Objects::ProductImageType, null: false

      def id
        object.product_id
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
