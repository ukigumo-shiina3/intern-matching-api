module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :company_id, ID, null: false
    field :company, Types::CompanyType, null: false
    field :title, String, null: false
    field :intern_conditions, String, null: false
    field :is_published, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
