class DeleteChartsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :charts
  end
end
