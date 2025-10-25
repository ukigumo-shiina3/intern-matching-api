module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :firebase_uid, String, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :prefecture, String, null: false
    field :municipality, String, null: false
    field :address_line, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
