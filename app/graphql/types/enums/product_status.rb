module Types
  module Enums
    class ProductStatus < BaseEnum
      Product.statuses.each_key do |status|
        value status
      end
    end
  end
end

