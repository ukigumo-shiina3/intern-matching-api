module Types
  class InternType < Types::BaseObject
    field :id, ID, null: false
    field :firebase_uid, String, null: false
    field :field_of_study, Types::FieldOfStudyType, null: false
    field :school_year, Types::SchoolYearType, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :school_name, String, null: false
    field :major_name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
