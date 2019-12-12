class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, :null => false
      t.integer :status, :null => false, :default => 0
      t.integer :payment, :null => false
      t.datetime :order_time, :null => false
      t.integer :total_price, :null => false
      t.integer :delivery_charge, :null => false
      t.string :delivery_name, :null => false
      t.string :postal_code, :null => false
      t.string :destination, :null => false
      t.boolean :is_deleted, :null => false, :default =>false

      t.timestamps
    end
    add_index :orders, :is_deleted
  end
end
