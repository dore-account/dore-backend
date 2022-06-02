module Mutations
  module Creator
    class CreateCreator < AuthMutation
      field :creator, Types::Objects::CreatorType, null: false

      argument :params, Types::Inputs::CreatorInputType, required: false

      def resolve(params:)
        creator = ::Creator.find_or_create_by!(user: current_user)

        { creator: creator }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
