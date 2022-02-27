module Mutations
  module Product
    class CreateProduct < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :params, Types::Inputs::ProductInputType, required: true

      # rubocop:disable Metrics/MethodLength
      def resolve(params:)
        product = ::Product.create!(
          creator: current_user.creator,
          status: :active
        )

        product_info = product.create_product_info!(
          name: params.name,
          description: params.description,
          price: params.price,
          stock_quantity: params.stock_quantity
        )

        { product: product_info }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
