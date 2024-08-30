class Message < ApplicationRecord
  belongs_to :chat, dependent: :destroy
  belongs_to :user

  after_create_commit do
    broadcast_append_to(
      chat,
      partial: "messages/message",
      locals: { message: self, current_user: nil },
      target: "messages"
    )
  end
end
