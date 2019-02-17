class AddDataToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :data1, :integer
    add_column :articles, :data2, :integer
    add_column :articles, :data3, :integer
    add_column :articles, :data4, :integer
    add_column :articles, :data5, :integer
  end
end
