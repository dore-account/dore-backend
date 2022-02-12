module Types
  module Objects
    class CreatorType < BaseObject
      field :id, ID, null: false, description: 'クリエイターID'
      field :user, Types::Objects::UserType, null: false
      field :info, Types::Objects::CreatorInfoType, null: false, description: 'クリエイター特有の情報'
      field :category, [Types::Objects::CreatorCategoryType], null: false, description: 'クリエイターのカテゴリー'

      def user
        object.user.user_detail
      end

      def info
        object.creator_info
      end

      def category
        object.creator_category
      end

    end
  end
end