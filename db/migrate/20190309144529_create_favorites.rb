class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:user, :article], unique: true
  end
end
