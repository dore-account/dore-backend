class Order < ApplicationRecord
  belongs_to :user
  belongs_to :creator

  has_one :payment
  has_many :order_items

  enum status: {
    ordered: 0, # 注文受付
    Paid: 1, # 支払い成功
    completed: 2, # 発送完了
    canceled: 3, # 注文取り消し
    Refunded: 4 # 返金がある場合、返金された
  }

  def total_price
    order_items.sum(&:price)
  end

  def total_fee
    order_items.sum(&:fee)
  end
end
