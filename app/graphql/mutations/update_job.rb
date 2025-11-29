# frozen_string_literal: true

module Mutations
  class UpdateJob < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :intern_conditions, String, required: false
    argument :is_published, Boolean, required: false

    field :job, Types::JobType, null: true
    field :errors, [ String ], null: false

    def resolve(id:, **attributes)
      job = Job.find_by(id: id)

      unless job
        return {
          job: nil,
          errors: [ "求人が見つかりません" ]
        }
      end

      if job.update(attributes.compact)
        {
          job:,
          errors: []
        }
      else
        {
          job: nil,
          errors: job.errors.full_messages
        }
      end
    end
  end
end
