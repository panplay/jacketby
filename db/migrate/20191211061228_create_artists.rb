class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
