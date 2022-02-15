class Image < ApplicationRecord
  has_one_attached :image

  has_one :user_image

  def name
    image.filename.to_s
  end

  def path
    return '' unless image.attached?

    Rails.application.routes.url_helpers.rails_storage_proxy_path(image, only_path: true)
  end
end
