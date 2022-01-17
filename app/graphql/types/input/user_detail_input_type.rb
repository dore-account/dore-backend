module Types
  module Input
    class UserDetailInputType < Types::BaseInputObject
      argument :uid, String, required: false
      argument :name, String, required: false
      argument :gender, Integer, required: false
      argument :introduction, String, required: false
      argument :birth_day_yy, Integer, required: false
      argument :birth_day_mm, Integer, required: false
      argument :birth_day_dd, Integer, required: false
      argument :twitter_link, String, required: false
      argument :instagram_link, String, required: false
      argument :tiktok_link, String, required: false
    end
  end
end
