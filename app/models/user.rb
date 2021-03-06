class User < ApplicationRecord
  has_one :user_detail
  has_one :user_info
  has_one :creator
  has_one :customer

  has_many :orders
  has_many :payment_methods
  has_many :purchases, dependent: :destroy
end
