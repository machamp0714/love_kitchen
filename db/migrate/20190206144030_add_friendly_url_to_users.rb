class AddFriendlyUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :friendly_url, :string

    add_index :users, :friendly_url, unique: true
  end
end
