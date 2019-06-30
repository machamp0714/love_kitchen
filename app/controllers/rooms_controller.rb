class RoomsController < ApplicationController
  def index
    @room = current_user.rooms.build
  end
end
