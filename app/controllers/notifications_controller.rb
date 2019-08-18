# frozen_string_literal: true

class NotificationsController < ApplicationController
  def already_read
    current_user.notifications.where(already: false).update_all(already: true)

    redirect_back(fallback_location: request.referrer)
  end
end
