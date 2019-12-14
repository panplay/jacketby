class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, :null => false
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :artists, [:name, :is_deleted]
  end
end
