class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :article_id
      t.integer :contributor_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
