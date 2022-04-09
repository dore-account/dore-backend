# rubocop:disable all

module StripeClient
  class << self

    def connect_stripe(creator)
      account = find_or_create_account(creator)

      account_links = Stripe::AccountLink.create({
        account: account.stripe_account_id,
        refresh_url: "#{ENV['CLIENT_HOST_URL']}/mypage",
        return_url: "#{ENV['CLIENT_HOST_URL']}/stripe/return",
        type: 'account_onboarding',
      })

      account_links.url
    end

    def confirm_connect_account(creator)
      account = Account.find_by(creator: creator)
      account_details = Stripe::Account.retrieve(account.stripe_account_id)

      if account_details.charges_enabled && account_details.details_submitted
        account.update!(is_completed: true)
      end

      account.is_completed
    end

    def dashboard(creator)
      account = Account.find_by(creator: creator)
      link = Stripe::Account.create_login_link(account.stripe_account_id)
      link.url
    end

    def get_card_list(user)
      customer = find_or_create_customer(user)

      payment_methods = Stripe::PaymentMethod.list({ customer: customer.stripe_customer_id, type: 'card' })

      payment_methods.data.map do |payment_method|
        { id: payment_method.id,
          brand: payment_method.card.brand,
          exp_month: payment_method.card.exp_month,
          exp_year: payment_method.card.exp_year,
          last4: payment_method.card.last4, }
      end
    end

    def register_card(user)
      customer = find_or_create_customer(user)

      intent = Stripe::SetupIntent.create(
        customer: customer.stripe_customer_id,
        payment_method_types: ['card']
      )
      intent.client_secret
    end

    def create_payment_intent(user, payment_method_id, amount, fee, stripe_account_id)
      customer = find_or_create_customer(user)

      begin
        payment_intent = Stripe::PaymentIntent.create(
          customer: customer.stripe_customer_id,
          payment_method: payment_method_id,
          amount: amount,
          currency: 'jpy',
          application_fee_amount: fee,
          transfer_data: {
            # 売り手のstripeアカウントID
            destination: stripe_account_id,
          },
        )

      rescue Stripe::CardError => e
        # Error code will be authentication_required if authentication is needed
        puts "Error is: \#{e.error.code}"
        payment_intent_id = e.error.payment_intent.id
        payment_intent = Stripe::PaymentIntent.retrieve(payment_intent_id)
        puts payment_intent.id
      end

      payment_intent.client_secret
    end

    private

    def find_or_create_customer(user)
      customer = Customer.find_by(user: user)
      return customer if customer

      customer = Stripe::Customer.create({ email: user.email })
      Customer.create!(user: user, stripe_customer_id: customer.id)
    end

    def find_or_create_account(creator)
      account = Account.find_by(creator: creator)
      return account if account

      account = Stripe::Account.create({
        type: 'express',
        country: 'JP',
        email: creator.user.email,
        business_type: 'individual',
        capabilities: {
          card_payments: {requested: true},
          transfers: {requested: true},
        },
      })
      Account.create!(creator: creator, stripe_account_id: account.id)
    end
  end
end
