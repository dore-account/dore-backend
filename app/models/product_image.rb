class ProductImage < ApplicationRecord
  belongs_to :product_info
  belongs_to :image, dependent: :destroy

  delegate :path, to: :image
end
