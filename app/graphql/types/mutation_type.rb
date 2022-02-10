module Types
  class MutationType < Types::Objects::BaseObject
    field :update_user_detail, mutation: Mutations::UpdateUserDetail
  end
end
