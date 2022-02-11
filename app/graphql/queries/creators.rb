module Queries
  class Creators < BaseQuery
    type [Types::Objects::UserType], null: false

    def resolve
      Creator.all
    end
  end
end

