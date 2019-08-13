# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :followed_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :relationships, :followed_id
    add_index :relationships, :follower_id
    add_index :relationships, [:followed_id, :follower_id], unique: true
  end
end
