class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :label1, :string
    add_column :articles, :label2, :string
    add_column :articles, :label3, :string
    add_column :articles, :label4, :string
    add_column :articles, :label5, :string
    add_column :articles, :data1, :integer
    add_column :articles, :data2, :integer
    add_column :articles, :data3, :integer
    add_column :articles, :data4, :integer
    add_column :articles, :data5, :integer
  end
end
