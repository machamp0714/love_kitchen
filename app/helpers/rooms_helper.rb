module RoomsHelper
  def your_room?(room)
    current_user.id == room.user_id
  end
end
