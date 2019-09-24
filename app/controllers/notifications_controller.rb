# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    current_user.update(unread: 0)
    @notifications = current_user.notifications
  end
end
