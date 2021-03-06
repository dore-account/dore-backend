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
      field :images, [Types::Objects::UserImageType], null: false

      field :info, Types::Objects::UserInfoType, null: true

      def id
        object.user_id
      end

      def age
        today = Time.zone.today.strftime('%Y%m%d').to_i
        y = object.birth_day_yy
        m = object.birth_day_mm
        d = object.birth_day_dd

        m = "0#{m}" if m < 10
        d = "0#{d}" if d < 10

        birth_day = "#{y}#{m}#{d}"

        (today - birth_day.to_i) / 10_000
      end

      def info
        object.user.user_info
      end

      def images
        object.user_images
      end
    end
  end
end
