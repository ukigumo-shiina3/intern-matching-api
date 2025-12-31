# frozen_string_literal: true

module Mutations
  class UpdateJob < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :intern_conditions, String, required: false
    argument :is_published, Boolean, required: false

    field :job, Types::JobType, null: false

    def resolve(id:, **attributes)
      job = Job.find_by(id: id)

      unless job
        raise GraphQL::ExecutionError, "求人が見つかりません"
      end

      unless job.update(attributes.compact)
        raise GraphQL::ExecutionError, "求人情報の更新に失敗しました"
      end

      { job: job }
    end
  end
end
