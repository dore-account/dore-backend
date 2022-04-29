module Types
  module Objects
    class OrderType < BaseObject
      field :id, ID, null: false, description: '注文ID'
    end
  end
end
