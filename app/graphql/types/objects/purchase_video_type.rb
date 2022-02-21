module Types
  module Objects
    class PurchaseVideoType < BaseObject
      field :id, ID, null: false, description: '動画のID'
      field :path, String, null: false, description: '動画のURL'
    end
  end
end