module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :uid, String, null: false
    field :name, String
    field :gender, Integer
    field :introduction, String
    field :birth_day_yy, Integer
    field :birth_day_mm, Integer
    field :birth_day_dd, Integer
    field :twitter_link, String
    field :instagram_link, String
    field :tiktok_link, String
  end
end
