# frozen_string_literal: true

module Mutations
  class CreateJob < BaseMutation
    argument :company_id, ID, required: true
    argument :title, String, required: true
    argument :intern_conditions, String, required: true
    argument :is_published, Boolean, required: true

    field :job, Types::JobType, null: false

    def resolve(company_id:, title:, intern_conditions:, is_published:)
      job = Job.new(
        company_id: company_id,
        title: title,
        intern_conditions: intern_conditions,
        is_published: is_published
      )

      unless job.save
        raise GraphQL::ExecutionError, "求人情報の保存に失敗しました"
      end

      { job: job }
    end
  end
end
