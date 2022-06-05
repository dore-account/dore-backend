module Types
  module Objects
    class CreatorType < BaseObject
      field :id, ID, null: false, description: 'クリエイターID'
      field :user, Types::Objects::UserType, null: false
      field :info, Types::Objects::CreatorInfoType, null: true, description: 'クリエイター特有の情報'
      field :categories, [Types::Objects::CreatorCategoryType], null: true, description: 'クリエイターのカテゴリー'
      field :products, [Types::Objects::ProductType], null: true, description: 'クリエイターの商品'

      def user
        object.user.user_detail
      end

      def info
        object.creator_info
      end

      def categories
        object.creator_categories
      end

      def products
        object.product_infos
      end
    end
  end
end
