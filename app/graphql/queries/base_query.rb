module Queries
  class BaseQuery < GraphQL::Schema::Resolver

    def current_user
      context[:current_user]
    end

    def current_creator
      current_user.creator
    end
  end
end
