class Order < ApplicationRecord
  belongs_to :user
  belongs_to :creator

  has_many :order_items
end
