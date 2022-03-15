module Types
  module Objects
    class StripeConfirmConnectType < BaseObject
      field :is_completed, Boolean, null: false, description: 'コネクトが成功したか'
    end
  end
end
