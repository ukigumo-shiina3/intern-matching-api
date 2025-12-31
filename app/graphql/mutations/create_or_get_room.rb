module Mutations
  class CreateOrGetRoom < BaseMutation
    argument :intern_id, ID, required: true
    argument :company_id, ID, required: true

    field :room, Types::RoomType, null: false

    def resolve(intern_id:, company_id:)
      room = Room.find_or_create_by(intern_id: intern_id, company_id: company_id)

      unless room.persisted?
        raise GraphQL::ExecutionError, "ルームの作成に失敗しました"
      end

      { room: room }
    end
  end
end
