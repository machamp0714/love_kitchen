# frozen_string_literal: true

class AddUnreadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unread, :integer, default: 0
  end
end
