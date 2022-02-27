module StripeClient
  class << self
    def get_card_list(user)
      account = find_or_create_customer(user)

      payment_methods = Stripe::PaymentMethod.list({ customer: account.customer_id, type: 'card' })

      payment_methods.data.map do |payment_method|
        { id: payment_method.id,
          brand: payment_method.card.brand,
          exp_month: payment_method.card.exp_month,
          exp_year: payment_method.card.exp_year,
          last4: payment_method.card.last4 }
      end
    end

    def register_card(user)
      account = find_or_create_customer(user)

      intent = Stripe::SetupIntent.create(
        customer: account.customer_id,
        payment_method_types: ['card']
      )
      intent.client_secret
    end

    private

    def find_or_create_customer(user)
      account = Account.find_by(user: user)
      return account if account

      customer = Stripe::Customer.create({ email: user.email })
      Account.create!(user: user, customer_id: customer.id)
    end
  end
end
