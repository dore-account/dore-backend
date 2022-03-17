module Types
  module Inputs
    class CreatorInputType < BaseInputObject
      argument :category_ids, [ID], required: true
      argument :belongs, String, required: true
    end
  end
end
