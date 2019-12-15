class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image_id, :null => false
      t.string :name, :null => false
      t.integer :artist_id, :null => false
      t.integer :price, :null => false
      t.string :release_date, :null => false
      t.integer :label_id, :null => false
      t.integer :category_id, :null => false
      t.text :comment
      t.integer :status, :null => false, :default =>0
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :items, [:name, :artist_id, :is_deleted], unique: true
  end
end
