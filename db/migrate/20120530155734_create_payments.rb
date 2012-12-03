class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :credential
      t.string :method
      t.float :amount
      t.references :user
      t.string :observation

      t.timestamps
    end
    add_index :payments, :credential_id
    add_index :payments, :user_id
  end
end
