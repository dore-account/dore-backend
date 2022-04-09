module Mutations
  class AuthMutation < BaseMutation
    def authorized?(_args = {})
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]

      true
    end
  end
end
