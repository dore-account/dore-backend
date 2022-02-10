module Types
  module Objects
    class BaseObject < GraphQL::Schema::Object
      edge_type_class(Types::BaseEdge)
      connection_type_class(Types::BaseConnection)
      field_class Types::BaseField
    end
  end
end
