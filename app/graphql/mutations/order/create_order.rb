module Mutations
  module Order
    class CreateOrder < BaseMutation
      field :order, Types::Objects::OrderType, null: false

      argument :params, Types::Inputs::OrderInputType, required: true

      # rubocop:disable Mertrics/MethodLength, Mertics/AbcSize, Metrics/BlockLength
      def resolve(params:)
        order = ::Order.new
        ActiveRecord::Base.transaction do
          order.update!(
            user: current_user,
            creator_id: params.creator_id,
            status: 0
          )
          ::Payment.create!(
            order: order,
            payment_method_id: params.payment_method_id
          )

          # TODO: 商品が複数の場合
          order_item = ::OrderItem.create!(
            order: order,
            product_id: params.product_id,
            quantity: params.quantity
          )
          ::Balance.create!(
            creator_id: params.creator_id,
            order_item: order_item,
            amount: order.total_price
          )
        end

        { order: order }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
      # rubocop:enable Mertrics/MethodLength, Mertics/AbcSize, Metrics/BlockLength
    end
  end
end
