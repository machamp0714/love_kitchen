# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = current_user.rooms.build
    @rooms = Room.includes(:user).order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end

  def create
    room = current_user.rooms.create(room_params)
    if room.save
      redirect_back(fallback_location: request.referrer, notice: "スレッドを作成しました。")
    else
      redirect_back(fallback_location: request.referrer, alert: "スレッドの作成に失敗しました。")
    end
  end

  def update
    room = current_user.rooms.find(params[:id])
    if room.update(room_params)
      redirect_back(fallback_location: request.referrer, notice: "スレッドを更新しました。")
    else
      redirect_back(fallback_location: request.referrer, alert: "スレッドの更新に失敗しました。")
    end
  end

  def destroy
    current_user.rooms.find(params[:id]).destroy
    redirect_back(fallback_location: request.referrer, notice: "スレッドを削除しました。")
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end
end
