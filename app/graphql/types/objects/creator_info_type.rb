module Types
  module Objects
    class CreatorInfoType < BaseObject
      field :id, ID, null: false, description: 'クリエイターID'
      field :creator_id, ID, null: false
      field :belongs, String, null: false, description: '所属先'
    end
  end
end
