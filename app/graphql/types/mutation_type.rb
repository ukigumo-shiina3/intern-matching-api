# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_intern, mutation: Mutations::CreateIntern
  end
end
