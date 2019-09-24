class AddContentToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :content, :string
  end
end
