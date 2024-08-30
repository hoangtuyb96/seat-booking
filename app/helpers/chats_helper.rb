module ChatsHelper
  def chat_friends(chat)
    chat.members.without(current_user)
  end

  def chat_name(chat)
    chat.members.without(current_user).map { |u| u.full_name }.join(",")
  end
end
