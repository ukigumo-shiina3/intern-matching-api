# frozen_string_literal: true

module Mutations
  class CreateCompany < BaseMutation
    argument :firebase_uid, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :prefecture_id, ID, required: true
    argument :municipality_id, ID, required: true
    argument :address_line, String, required: true
    argument :web_url, String, required: false

    field :company, Types::CompanyType, null: true
    field :errors, [ String ], null: false

    def resolve(firebase_uid:, name:, email:, prefecture_id:, municipality_id:, address_line:, web_url: nil)
      company = Company.new(
        firebase_uid: firebase_uid,
        name: name,
        email: email,
        prefecture_id: prefecture_id,
        municipality_id: municipality_id,
        address_line: address_line,
        web_url: web_url
      )

      if company.save
        {
          company:,
          errors: []
        }
      else
        {
          company: nil,
          errors: company.errors.full_messages
        }
      end
    end
  end
end
