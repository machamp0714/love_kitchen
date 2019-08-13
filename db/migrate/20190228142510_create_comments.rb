# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
