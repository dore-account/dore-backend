module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def current_user
      context[:current_user]
    end
  end
end
