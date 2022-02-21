module Mutations
  class AuthCreatorMutation < BaseMutation
    def authorized?(args)
      # 認可できない場合はGraphQL::ExecutionErrorをraise
      raise GraphQL::ExecutionError, 'login required!!' unless current_user.creator

      true
    end
  end
end

