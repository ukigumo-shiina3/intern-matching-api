# frozen_string_literal: true

module Mutations
  class CreateEntry < BaseMutation
    argument :intern_id, ID, required: true
    argument :job_id, ID, required: true

    field :entry, Types::EntryType, null: true
    field :errors, [ String ], null: false

    def resolve(intern_id:, job_id:)
      existing_entry = Entry.find_by(intern_id: intern_id, job_id: job_id)
      if existing_entry
        return {
          entry: nil,
          errors: [ "既にこの求人に応募しています" ]
        }
      end

      entry = Entry.new(
        intern_id: intern_id,
        job_id: job_id,
        current_status: "応募済み"
      )

      if entry.save
        {
          entry:,
          errors: []
        }
      else
        {
          entry: nil,
          errors: entry.errors.full_messages
        }
      end
    end
  end
end
