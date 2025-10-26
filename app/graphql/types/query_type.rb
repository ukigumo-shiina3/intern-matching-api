# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :rooms, [ Types::RoomType ], null: false do
      argument :intern_id, ID, required: false
      argument :company_id, ID, required: false
    end

    def rooms(intern_id: nil, company_id: nil)
      scope = Room.all
      scope = scope.where(intern_id: intern_id) if intern_id
      scope = scope.where(company_id: company_id) if company_id
      scope
    end

    field :room, Types::RoomType, null: true do
      argument :id, ID, required: true
    end

    def room(id:)
      Room.find_by(id: id)
    end

    field :messages, [ Types::MessageType ], null: false do
      argument :room_id, ID, required: true
    end

    def messages(room_id:)
      Message.where(room_id: room_id).order(created_at: :asc)
    end

    field :intern, Types::InternType, null: true do
      argument :firebase_uid, String, required: false
      argument :id, ID, required: false
    end

    def intern(firebase_uid: nil, id: nil)
      if firebase_uid
        Intern.find_by(firebase_uid: firebase_uid)
      elsif id
        Intern.find_by(id: id)
      end
    end

    field :company, Types::CompanyType, null: true do
      argument :firebase_uid, String, required: false
      argument :id, ID, required: false
    end

    def company(firebase_uid: nil, id: nil)
      if firebase_uid
        Company.find_by(firebase_uid: firebase_uid)
      elsif id
        Company.find_by(id: id)
      end
    end
  end
end
