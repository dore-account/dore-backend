module Types
  module Objects
    class ProductImageType < BaseObject
      field :id, ID, null: false, description: '画像のID'
      field :path, String, null: false, description: '画像のURL'

      def id
        object.id
      end
    end
  end
end
