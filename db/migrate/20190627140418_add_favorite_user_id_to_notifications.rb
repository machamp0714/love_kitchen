class AddFavoriteUserIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :favorite_user_id, :integer
  end
end
