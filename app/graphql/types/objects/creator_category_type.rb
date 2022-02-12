module Types
  module Objects
    class CreatorCategoryType < BaseObject
      field :id, ID, null: false, description: 'クリエイターID'
      field :creator_id, ID, null: false
      field :name, String, null: false, description: 'カテゴリー'

      def name
        object.category.name
      end
    end
  end
end
