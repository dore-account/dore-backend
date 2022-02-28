module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::Inputs::BaseInputObject
    object_class Types::Objects::BaseObject

    def current_user
      context[:current_user]
    end

    def current_creator
      current_user.creator
    end
  end
end
