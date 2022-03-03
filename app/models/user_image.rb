class UserImage < ApplicationRecord
  belongs_to :user_detail
  belongs_to :image, dependent: :destroy

  delegate :path, to: :image
end
