class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :video

  delegate :path, to: :video
end
