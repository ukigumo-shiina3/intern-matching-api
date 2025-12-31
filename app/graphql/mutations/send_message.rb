module Mutations
  class SendMessage < BaseMutation
    argument :room_id, ID, required: true
    argument :content, String, required: true
    argument :intern_id, ID, required: false
    argument :company_id, ID, required: false

    field :message, Types::MessageType, null: false

    def resolve(room_id:, content:, intern_id: nil, company_id: nil)
      message = Message.new(
        room_id: room_id,
        content: content,
        intern_id: intern_id,
        company_id: company_id
      )

      unless message.save
        raise GraphQL::ExecutionError, "メッセージの送信に失敗しました"
      end

      { message: message }
    end
  end
end
