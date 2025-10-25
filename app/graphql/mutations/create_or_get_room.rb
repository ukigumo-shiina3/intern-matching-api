module Mutations
  class CreateOrGetRoom < BaseMutation
    argument :intern_id, ID, required: true
    argument :company_id, ID, required: true

    field :room, Types::RoomType, null: false
    field :errors, [String], null: false

    def resolve(intern_id:, company_id:)
      room = Room.find_or_create_by(intern_id: intern_id, company_id: company_id)

      if room.persisted?
        { room: room, errors: [] }
      else
        { room: nil, errors: room.errors.full_messages }
      end
    end
  end
end
