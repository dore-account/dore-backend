module Mutations
  module Purchase
    class UploadPurchaseVideo < AuthCreatorMutation
      field :purchase_video, Types::Objects::PurchaseVideoType, null: false

      argument :user_id, ID, required: true
      argument :video, ApolloUploadServer::Upload, required: true

      def resolve(user_id:, video:)
        user = ::User.find(user_id)
        purchase_video = user.purchases.new

        ActiveRecord::Base.transaction do
          new_video = ::Video.new
          # ApolloUploadServer::Uploadをそのまま渡せないのでioとfilenameを渡す
          new_video.video.attach(io: video.to_io, filename: video.original_filename)

          purchase_video.update!(video: new_video)
        end

        { purchase_video: purchase_video }
      end
    end
  end
end