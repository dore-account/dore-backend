module Queries
  class BaseQuery < GraphQL::Schema::Resolver

    def current_user
      context[:current_user]
    end

    def current_creator
      context[:current_creator]
    end
  end
end
