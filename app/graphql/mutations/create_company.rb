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

    field :company, Types::CompanyType, null: false

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

      unless company.save
        raise GraphQL::ExecutionError, "企業情報の保存に失敗しました"
      end

      { company: company }
    end
  end
end
