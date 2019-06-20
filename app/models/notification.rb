class Notification < ApplicationRecord
  belongs_to :user

  def self.count
    Notification.where(user_id: Current.user.id, already: false).count
  end
end
