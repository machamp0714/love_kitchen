# frozen_string_literal: true

class RemoveColumnFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :article_id, :integer
    remove_column :notifications, :like_user_id, :integer
    remove_column :notifications, :comment_user_id, :integer
    remove_column :notifications, :favorite_user_id, :integer
    remove_column :notifications, :already, :boolean
  end
end
