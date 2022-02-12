module Types
  module Objects
    class UserInfoType < BaseObject
      field :id, ID, null: false, description: 'クリエイターID'
      field :user_id, ID, null: false
      field :stan, String, null: false, description: '推し'
    end
  end
end

