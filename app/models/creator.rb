class Creator < ApplicationRecord
  belongs_to :user
  has_one :creator_info
  has_one :account
  has_many :creator_categories
  has_many :products
  has_many :orders

  belongs_to :user_detail, foreign_key: :user_id, primary_key: :user_id, inverse_of: :creator
  has_many :product_infos, through: :products

  delegate :slug, to: :user_detail
end
