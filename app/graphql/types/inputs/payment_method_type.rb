module Types
  module Inputs
    class PaymentMethodType < BaseInputObject
      argument :provider, String, required: true
      argument :type, String, required: true
    end
  end
end
