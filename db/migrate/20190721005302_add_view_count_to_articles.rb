class AddViewCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :view_count, :integer, default: 0
  end
end
