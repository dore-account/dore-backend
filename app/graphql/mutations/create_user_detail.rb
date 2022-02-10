module Mutations
  class CreateUserDetail < BaseMutation
    field :user, Types::Objects::UserType, null: false

    argument :params, Types::Inputs::UserDetailInputType, required: true

    def resolve(params:)
      user_detail = UserDetail.create!(
        user: current_user,
        name: params.name,
        gender: params.gender,
        introduction: params.introduction,
        birth_day_yy: params.birth_day_yy,
        birth_day_mm: params.birth_day_mm,
        birth_day_dd: params.birth_day_dd,
        twitter_link: params.twitter_link,
        instagram_link: params.instagram_link,
        tiktok_link: params.tiktok_link,
      )

      { user: user_detail }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
