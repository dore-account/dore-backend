module Types
  class MutationType < Types::Objects::BaseObject
    # user
    field :create_user, mutation: Mutations::User::CreateUser
    field :update_user, mutation: Mutations::User::UpdateUser
    field :update_user_info, mutation: Mutations::User::UpdateUserInfo
    field :upload_user_image, mutation: Mutations::User::UploadUserImage
    field :delete_user_image, mutation: Mutations::User::DeleteUserImage

    # creator
    field :create_creator, mutation: Mutations::Creator::CreateCreator

    # product
    field :create_product, mutation: Mutations::Product::CreateProduct
    field :update_product, mutation: Mutations::Product::UpdateProduct
    field :delete_product, mutation: Mutations::Product::DeleteProduct
    field :upload_product_image, mutation: Mutations::Product::UploadProductImage
    field :delete_product_image, mutation: Mutations::Product::DeleteProductImage

    # stripe
    field :connect_stripe, mutation: Mutations::Stripe::Connect

    # payment_method
    field :create_payment_method, mutation: Mutations::PaymentMethod::CreatePaymentMethod
    field :setup_payment_method, mutation: Mutations::PaymentMethod::SetupPaymentMethod

    # order
    field :create_order, mutation: Mutations::Order::CreateOrder

    # purchase
    field :upload_purchase_video, mutation: Mutations::Purchase::UploadPurchaseVideo
  end
end
