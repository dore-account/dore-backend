module Types
  module Objects
    class UserType < BaseObject
      field :id, ID, null: false
      field :slug, String, null: false, description: '@** のようなuserの識別子'
      field :name, String, null: false
      field :gender, Types::Enums::GenderStatus, null: false
      field :introduction, String, null: false
      field :birth_day_yy, Integer, null: false, description: '誕生年'
      field :birth_day_mm, Integer, null: false, description: '誕生月'
      field :birth_day_dd, Integer, null: false, description: '誕生日'
      field :age, Integer, null: false, description: '年齢'
      field :twitter_link, String, null: false
      field :instagram_link, String, null: false
      field :tiktok_link, String, null: false

      field :info, Types::Objects::UserInfoType, null: false

      def id
        object.user_id
      end

      def age
        today = Time.zone.today.strftime("%Y%m%d").to_i
        y = object.birth_day_yy
        m = object.birth_day_mm
        d = object.birth_day_dd

        m = "0" + m.to_s if m < 10
        d = "0" + d.to_s if d < 10

        birth_day = y.to_s + m.to_s + d.to_s

        (today - birth_day.to_i) / 10000
      end

      def info
        object.user.user_info
      end
    end
  end
end
