module Queries
  class GetUsers < Queries::BaseQuery
    type [Types::Objects::UserType], null: false


    def resolve
      User.all
    end
  end
end

