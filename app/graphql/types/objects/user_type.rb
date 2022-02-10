module Types
  module Objects
    class UserType < BaseObject
      field :id, ID, null: false
      field :slug, String, null: false
      field :name, String, null: false
      field :gender, Types::Enums::GenderStatus, null: false
      field :introduction, String, null: false
      field :birth_day_yy, Integer, null: false
      field :birth_day_mm, Integer, null: false
      field :birth_day_dd, Integer, null: false
      field :twitter_link, String, null: false
      field :instagram_link, String, null: false
      field :tiktok_link, String, null: false

      def id
        object.user_id
      end
    end
  end
end
