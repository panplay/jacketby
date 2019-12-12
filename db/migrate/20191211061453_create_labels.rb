class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
