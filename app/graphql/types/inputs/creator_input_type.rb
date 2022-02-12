module Types
  module Inputs
    class CreatorInputType < BaseInputObject
      argument :category_id, ID, required: true
      argument :belongs, String, required: true
    end
  end
end