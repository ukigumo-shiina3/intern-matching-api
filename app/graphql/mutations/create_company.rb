# frozen_string_literal: true

module Mutations
  class CreateCompany < BaseMutation
    argument :firebase_uid, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :prefecture, String, required: true
    argument :municipality, String, required: true
    argument :address_line, String, required: true
    argument :web_url, String, required: false

    field :company, Types::CompanyType, null: true
    field :errors, [ String ], null: false

    def resolve(firebase_uid:, name:, email:, prefecture:, municipality:, address_line:, web_url: nil)
      company = Company.new(
        firebase_uid: firebase_uid,
        name: name,
        email: email,
        prefecture: prefecture,
        municipality: municipality,
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
