module Queries
  class AuthCreatorQuery < BaseQuery
    def authorized?(args={})
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_creator]

      true
    end
  end
end

