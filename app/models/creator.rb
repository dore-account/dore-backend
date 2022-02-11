class Creator < ApplicationRecord
  belongs_to :user
  has_one :creator_info
  has_many :creator_category
end
