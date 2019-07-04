module RoomsHelper
  def your_room?(room)
    current_user.id == room.user_id
  end

  def host_user?(message)
    message.user_id == message.room.user_id
  end
end
