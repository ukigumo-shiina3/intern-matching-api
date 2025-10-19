# frozen_string_literal: true

module Mutations
  class CreateIntern < BaseMutation
    argument :firebase_uid, String, required: true
    argument :field_of_study_id, String, required: true
    argument :school_year_id, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :school_name, String, required: true
    argument :major_name, String, required: true

    field :intern, Types::InternType, null: true
    field :errors, [ String ], null: false

    def resolve(firebase_uid:, field_of_study_id:, school_year_id:, name:, email:, school_name:, major_name:)
      intern = Intern.new(
        firebase_uid: firebase_uid,
        field_of_study_id: field_of_study_id,
        school_year_id: school_year_id,
        name: name,
        email: email,
        school_name: school_name,
        major_name: major_name
      )

      if intern.save
        {
          intern:,
          errors: []
        }
      else
        {
          intern: nil,
          errors: intern.errors.full_messages
        }
      end
    end
  end
end
