class Balance < ApplicationRecord
  belongs_to :creator
  belongs_to :order_item
end
