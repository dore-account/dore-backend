module Types
  class MutationType < Types::Objects::BaseObject
    # user
    field :update_user, mutation: Mutations::User::UpdateUser
    field :update_user_info, mutation: Mutations::User::UpdateInfo

    # creator
    field :update_creator, mutation: Mutations::Creator::UpdateCreator
  end
end
