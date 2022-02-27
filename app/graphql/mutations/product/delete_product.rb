module Mutations
  module Product
    class DeleteProduct < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        product = ::Product.find_by(id: id, creator: current_user.creator)
        product.destroy

        { product: product.product_info }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
