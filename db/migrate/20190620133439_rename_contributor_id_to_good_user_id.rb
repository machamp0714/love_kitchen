# frozen_string_literal: true

class RenameContributorIdToGoodUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :contributor_id, :good_user_id
  end
end
