class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :mail_address
      t.string :password

      t.timestamps
    end
  end
end
