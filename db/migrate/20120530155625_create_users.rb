class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.boolean :is_admin
      t.boolean :is_active

      t.timestamps
    end
  end
end
