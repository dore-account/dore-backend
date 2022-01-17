module Queries
  class GetUsers < Queries::BaseQuery
    type [Types::UserType], null: false

    argument :id, ID, required: false

    def resolve
      User.all
    end
  end
end

