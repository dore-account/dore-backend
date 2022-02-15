module Types
  module Objects
    class UserImageType < BaseObject
      field :id, ID, null: false, description: '画像のID'
      field :path, String, null: false, description: '画像のURL'
    end
  end
end