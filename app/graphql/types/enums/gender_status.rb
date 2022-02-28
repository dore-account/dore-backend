module Types
  module Enums
    class GenderStatus < BaseEnum
      UserDetail.genders.each_key do |status|
        value status
      end
    end
  end
end
