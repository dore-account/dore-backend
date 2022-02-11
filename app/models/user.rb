class User < ApplicationRecord
  has_one :user_detail
  has_one :creator
end
