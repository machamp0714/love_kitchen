module NotificationsHelper
  def already_read?
    current_user.notifications.all? { |notification| notification.already? }
  end
end