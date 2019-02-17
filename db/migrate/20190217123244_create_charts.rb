class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.string :label1
      t.string :label2
      t.string :label3
      t.string :label4
      t.string :label5
      t.integer :data1
      t.integer :data2
      t.integer :data3
      t.integer :data4
      t.integer :data5
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
