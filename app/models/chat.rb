class Chat < ApplicationRecord
  has_many :messages, -> { order(id: :asc) }, dependent: :destroy

  has_many :chat_memberships, inverse_of: :chat, dependent: :destroy
  has_many :members, through: :chat_memberships, source: :user

  class << self
    def chat_name_for(*users)
      users.map(&:id).sort.map {|id| "u#{id}" }.join("_")
    end

    def find_or_create_for(*users)
      raise AgrumentError, "At least 2 users." if users.size < 2
      name = chat_name_for(*users)
      self.create_with(members: users).create_or_find_by(name: name)
    end
  end
end
