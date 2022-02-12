module Queries
  class Creators < BaseQuery
    type [Types::Objects::CreatorType], null: false

    def resolve
      Creator.all
    end
  end
end

