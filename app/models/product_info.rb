class ProductInfo < ApplicationRecord
  belongs_to :product
  has_one :product_image, dependent: :destroy
  has_one :image, through: :product_image, class_name: 'Image', source: :image

  has_one :creator, through: :product
end
