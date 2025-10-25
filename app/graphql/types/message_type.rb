module Types
  class MessageType < Types::BaseObject
    field :id, ID, null: false
    field :room, Types::RoomType, null: false
    field :intern, Types::InternType, null: true
    field :company, Types::CompanyType, null: true
    field :content, String, null: false
    field :read_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :sender, Types::SenderUnion, null: false

    def sender
      object.intern || object.company
    end
  end
end
