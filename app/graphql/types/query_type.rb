module Types
  class QueryType < Types::Objects::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # user
    field :user, resolver: Queries::User::User
    field :users, resolver: Queries::User::Users

    # creator
    field :creator_by_user, resolver: Queries::Creator::CreatorByUser
    field :creator, resolver: Queries::Creator::Creator
    field :creators, resolver: Queries::Creator::Creators

    # product
    field :products, resolver: Queries::Product::Products
    field :products_by_user, resolver: Queries::Product::ProductsByUser
    field :product, resolver: Queries::Product::Product

    # purchase
    field :all_purchases, resolver: Queries::Purchase::AllPurchases
    field :purchase, resolver: Queries::Purchase::Purchase

    # payment_method
    field :payment_methods, resolver: Queries::PaymentMethod::PaymentMethods
    field :setup_payment_method, resolver: Queries::PaymentMethod::SetupPaymentMethod

    # stripe
    field :confirm_connect_stripe, resolver: Queries::Stripe::ConfirmConnect
    field :dashboard_stripe, resolver: Queries::Stripe::Dashboard

    # category
    field :categories, resolver: Queries::Category::Categories
  end
end
