module Queries
  class AuthQuery < Queries::BaseQuery
    def authorized?(args)
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]

      true
    end
  end
end

