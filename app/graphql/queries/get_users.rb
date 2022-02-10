module Queries
  class GetUsers < Queries::BaseQuery
    type [Types::Objects::UserType], null: false

    argument :id, ID, required: false

    def resolve
      User.all
    end
  end
end

