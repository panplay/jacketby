class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, :null => false
      t.string :address, :null => false
      t.integer :customer_id, :null => false
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :addresses, :is_deleted
  end
end
