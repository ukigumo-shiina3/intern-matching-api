module Types
  class RoomType < Types::BaseObject
    field :id, ID, null: false
    field :intern, Types::InternType, null: false
    field :company, Types::CompanyType, null: false
    field :messages, [ Types::MessageType ], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
