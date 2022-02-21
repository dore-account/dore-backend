class UserImage < ApplicationRecord
  belongs_to :user_detail
  belongs_to :image

  delegate :path, to: :image
end
