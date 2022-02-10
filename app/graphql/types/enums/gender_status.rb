module Types
  module Enums
    class GenderStatus < BaseEnum
      UserDetail.genders.keys.each do |status|
        value status
      end
    end
  end
end