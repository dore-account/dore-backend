class ProductImage < ApplicationRecord
  belongs_to :product
  belongs_to :image, dependent: :destroy

  delegate :path, to: :image
end
