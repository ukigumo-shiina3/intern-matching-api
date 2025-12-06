# frozen_string_literal: true

module Types
  class EntryType < Types::BaseObject
    field :id, ID, null: false
    field :intern_id, ID, null: false
    field :job_id, ID, null: false
    field :current_status, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :intern, Types::InternType, null: false
    field :job, Types::JobType, null: false
  end
end
