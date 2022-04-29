module Types
  module Inputs
    class OrderInputType < BaseInputObject
      argument :creator_id, ID, required: true
      argument :product_id, ID, required: true
      argument :payment_method_id, ID, required: true
      argument :quantity, Integer, required: true
    end
  end
end
