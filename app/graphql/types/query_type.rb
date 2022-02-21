module Types
  class QueryType < Types::Objects::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, resolver: Queries::User
    field :creators, resolver: Queries::Creators

    # purchase
    field :all_purchases, resolver: Queries::Purchase::AllPurchases
    field :purchase, resolver: Queries::Purchase::Purchase
  end
end
