class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :status
      t.integer :payment
      t.datetime :order_time
      t.integer :total_price
      t.integer :delivery_charge
      t.string :delivery_name
      t.string :postal_code
      t.string :destination
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
