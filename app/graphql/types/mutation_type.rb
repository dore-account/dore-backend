module Types
  class MutationType < Types::Objects::BaseObject
    # user
    field :update_user, mutation: Mutations::User::UpdateUser
    field :update_user_info, mutation: Mutations::User::UpdateUserInfo
    field :upload_user_image, mutation: Mutations::User::UploadUserImage
    field :delete_user_image, mutation: Mutations::User::DeleteUserImage

    # creator
    field :update_creator, mutation: Mutations::Creator::UpdateCreator

    # purchase
    field :upload_purchase_video, mutation: Mutations::Purchase::UploadPurchaseVideo
  end
end
