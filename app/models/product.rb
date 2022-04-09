class Product < ApplicationRecord
  belongs_to :creator
  has_one :product_info, dependent: :destroy
  has_one :product_inventory, dependent: :destroy
  has_one :product_image, dependent: :destroy
  has_one :image, through: :product_image, class_name: 'Image', source: :image

  has_many :order_items

  enum status: {
    draft: 0,
    active: 1,
    archived: 2
  }
end
