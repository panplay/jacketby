class CreateArrivalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_items do |t|
      t.integer :arrival_count, :null => false
      t.datetime :arrival_time, :null => false
      t.integer :item_id, :null => false
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :arrival_items, :is_deleted
  end
end
