module Types
  class MutationType < Types::Objects::BaseObject
    field :update_user_detail, mutation: Mutations::UpdateUserDetail
    field :create_user_detail, mutation: Mutations::CreateUserDetail
  end
end
