# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_intern, mutation: Mutations::CreateIntern
    field :create_company, mutation: Mutations::CreateCompany
    field :create_or_get_room, mutation: Mutations::CreateOrGetRoom
    field :send_message, mutation: Mutations::SendMessage
  end
end
