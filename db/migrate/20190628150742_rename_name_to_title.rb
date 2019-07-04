class RenameNameToTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :name, :title
  end
end
