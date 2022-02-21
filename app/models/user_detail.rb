class UserDetail < ApplicationRecord
  before_create :set_slug
  belongs_to :user
  has_many :user_images, dependent: :destroy
  has_many :images, through: :user_images, class_name: 'Image', source: :image

  validates :slug, uniqueness: true

  enum gender: {
    male: 0,
    woman: 1
  }

  private

  def set_slug
    # id未設定、または、すでに同じidのレコードが存在する場合はループに入る
    while slug.blank? || UserDetail.find_by(slug: slug).present? do
      # ランダムな20文字をidに設定し、whileの条件検証に戻る
      self.slug = SecureRandom.alphanumeric(20)
    end
  end
end
