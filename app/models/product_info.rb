class ProductInfo < ApplicationRecord
  belongs_to :product

  has_one :creator, through: :product
end
