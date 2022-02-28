module Mutations
  class AuthCreatorMutation < BaseMutation
    def authorized?(_args)
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, 'login required!!' unless current_creator

      true
    end
  end
end
