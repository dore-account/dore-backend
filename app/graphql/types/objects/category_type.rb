module Types
  module Objects
    class CategoryType < BaseObject
      field :id, ID, null: false, description: 'カテゴリーID'
      field :name, String, null: false, description: 'カテゴリー名'
    end
  end
end
