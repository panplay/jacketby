class CreateArrivalItems < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_items do |t|
      t.integer :arrival_count
      t.datetime :arrival_time
      t.integer :item_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
