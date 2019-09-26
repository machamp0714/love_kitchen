# frozen_string_literal: true

class AddArticleIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :article_id, :integer
    add_column :notifications, :follower_id, :integer
  end
end
