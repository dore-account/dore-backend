module Mutations
  module Product
    class UpdateProduct < AuthCreatorMutation
      field :product, Types::Objects::ProductType, null: false

      argument :id, ID, required: true
      argument :params, Types::Inputs::ProductInputType, required: true

      def resolve(id:, params:)
        product = ::Product.find_by(id: id, creator: current_user.creator)
        raise ActionController::BadRequest if product.nil?

        product_info = product.product_info
        product_info.update!(params.to_h)

        { product: product_info }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
