module Types
  module Inputs
    class PaymentMethodInputType < BaseInputObject
      argument :provider, String, required: true
      argument :type, String, required: true
    end
  end
end
