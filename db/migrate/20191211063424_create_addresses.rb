class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :customer_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
