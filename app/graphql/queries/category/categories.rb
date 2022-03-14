module Queries
  module Category
    class Categories < BaseQuery
      type [Types::Objects::CategoryType], null: false

      def resolve
        ::Category.all
      end
    end
  end
end
