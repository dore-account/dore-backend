class Creator < ApplicationRecord
  belongs_to :user
  has_one :creator_info
  has_one :account
  has_many :creator_categories
  has_many :products
  has_many :orders

  has_many :product_infos, through: :products
end
