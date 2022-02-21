class Video < ApplicationRecord
  has_one_attached :video

  has_one :purchase

  def name
    video.filename.to_s
  end

  def path
    return '' unless video.attached?

    Rails.application.routes.url_helpers.rails_storage_proxy_path(video, only_path: true)
  end
end
