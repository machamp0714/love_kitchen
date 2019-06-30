class RoomsController < ApplicationController
  def index
    @room = current_user.rooms.build
    @rooms = Room.includes(:user).order(created_at: :desc).all
  end

  def show
    room = Room.find(params[:id])
    @messages = room.messages.all
  end

  def create
    room = current_user.rooms.create(room_params)
    if room.save
      redirect_back(fallback_location: request.referer, notice: 'スレッドを作成しました。')
    else
      render :index
    end
  end

  def update
    room = current_user.rooms.find(params[:id])
    if room.update(room_params)
      redirect_back(fallback_location: request.referer, notice: 'スレッドを更新しました。')
    else
      render :index
    end
  end

  def destroy
    current_user.rooms.find(params[:id]).destroy
    redirect_back(fallback_location: request.referer, notice: 'スレッドを削除しました。')
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end
end
