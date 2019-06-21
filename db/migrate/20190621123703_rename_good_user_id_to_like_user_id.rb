class RenameGoodUserIdToLikeUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :good_user_id, :like_user_id
  end
end
