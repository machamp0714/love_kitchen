# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    current_user.update(unread: 0)
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(10)
    @notification_count = current_user.notifications.count
  end
end
