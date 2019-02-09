class RemovePictureFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :picture, :string
  end
end
