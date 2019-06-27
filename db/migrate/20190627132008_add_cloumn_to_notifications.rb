class AddCloumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :comment_user_id, :integer
  end
end
