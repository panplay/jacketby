class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image_id
      t.string :name
      t.integer :artist_id
      t.integer :price
      t.string :release_date
      t.integer :label_id
      t.integer :category_id
      t.text :comment
      t.integer :status
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
