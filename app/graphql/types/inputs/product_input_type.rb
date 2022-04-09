module Types
  module Inputs
    class ProductInputType < BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: true
      argument :price, Integer, required: true
      argument :quantity, Integer, required: true
    end
  end
end
