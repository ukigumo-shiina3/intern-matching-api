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

    field :prefectures, [ Types::PrefectureType ], null: false

    def prefectures
      Prefecture.includes(:municipalities).order(:id)
    end

    field :municipalities, [ Types::MunicipalityType ], null: false do
      argument :prefecture_id, ID, required: false
    end

    def municipalities(prefecture_id: nil)
      scope = Municipality.all
      scope = scope.where(prefecture_id: prefecture_id) if prefecture_id
      scope.order(:id)
    end

    field :company_jobs, [ Types::JobType ], null: false do
      argument :company_id, ID, required: true
    end

    def company_jobs(company_id:)
      Job.where(company_id: company_id).order(created_at: :desc)
    end

    field :published_jobs, [ Types::JobType ], null: false

    def published_jobs
      Job.where(is_published: true).order(created_at: :desc)
    end

    field :job, Types::JobType, null: true do
      argument :id, ID, required: true
    end

    def job(id:)
      Job.find_by(id: id)
    end

    field :entries, [ Types::EntryType ], null: false do
      argument :intern_id, ID, required: false
      argument :job_id, ID, required: false
    end

    def entries(intern_id: nil, job_id: nil)
      scope = Entry.all
      scope = scope.where(intern_id: intern_id) if intern_id
      scope = scope.where(job_id: job_id) if job_id
      scope.order(created_at: :desc)
    end

    field :school_years, [ Types::SchoolYearType ], null: false

    def school_years
      SchoolYear.order(:id)
    end

    field :field_of_studies, [ Types::FieldOfStudyType ], null: false

    def field_of_studies
      FieldOfStudy.order(:id)
    end
  end
end
