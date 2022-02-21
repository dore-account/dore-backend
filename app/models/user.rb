class User < ApplicationRecord
  has_one :user_detail
  has_one :user_info
  has_one :creator

  has_many :purchases, dependent: :destroy
end
