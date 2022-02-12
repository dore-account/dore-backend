module Types
  module Inputs
    class UserInputType < BaseInputObject
      argument :name, String, required: true
      argument :gender, Types::Enums::GenderStatus, required: true
      argument :introduction, String, required: false
      argument :birth_day_yy, Integer, required: true
      argument :birth_day_mm, Integer, required: true
      argument :birth_day_dd, Integer, required: true
      argument :twitter_link, String, required: false
      argument :instagram_link, String, required: false
      argument :tiktok_link, String, required: false
    end
  end
end
