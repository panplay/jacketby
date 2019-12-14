class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name, :null => false
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :labels, :is_deleted
  end
end
