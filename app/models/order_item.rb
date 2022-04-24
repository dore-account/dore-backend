class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def price
    product.product_info.price * quantity
  end

  def fee
    application_fee * quantity
  end

  def application_fee
    product.product_info.price * 0.1
  end
end
