class Balance < ApplicationRecord
  belongs_to :creator
  has_one :order_item
end
