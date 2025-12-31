# frozen_string_literal: true

module Mutations
  class CreateEntry < BaseMutation
    argument :intern_id, ID, required: true
    argument :job_id, ID, required: true

    field :entry, Types::EntryType, null: false

    def resolve(intern_id:, job_id:)
      existing_entry = Entry.find_by(intern_id: intern_id, job_id: job_id)
      if existing_entry
        raise GraphQL::ExecutionError, "既にこの求人に応募しています"
      end

      entry = Entry.new(
        intern_id: intern_id,
        job_id: job_id,
        current_status: "応募済み"
      )

      unless entry.save
        raise GraphQL::ExecutionError, "応募情報の保存に失敗しました"
      end

      { entry: entry }
    end
  end
end
