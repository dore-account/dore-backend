module Mutations
  module Creator
    class UpdateCreator < BaseMutation
      field :creator, Types::Objects::CreatorType, null: false

      argument :params, Types::Inputs::CreatorInputType, required: true

      def resolve(params:)
        creator = ::Creator.find_or_create_by!(user: current_user)

        creator_info = ::CreatorInfo.find_or_initialize_by(creator: creator)
        creator_category = ::CreatorCategory.find_or_initialize_by(creator: creator)

        creator_info.update!(belongs: params.belongs || '')
        creator_category.update!(category_id: params.category_id)

        { creator: creator }

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end