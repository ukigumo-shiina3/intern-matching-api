# frozen_string_literal: true

module Mutations
  class CreateJob < BaseMutation
    argument :company_id, ID, required: true
    argument :title, String, required: true
    argument :intern_conditions, String, required: true
    argument :is_published, Boolean, required: true

    field :job, Types::JobType, null: true
    field :errors, [ String ], null: false

    def resolve(company_id:, title:, intern_conditions:, is_published:)
      job = Job.new(
        company_id: company_id,
        title: title,
        intern_conditions: intern_conditions,
        is_published: is_published
      )

      if job.save
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
