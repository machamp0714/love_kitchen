# frozen_string_literal: true

class AddAlreadyToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :already, :boolean, default: false
  end
end
