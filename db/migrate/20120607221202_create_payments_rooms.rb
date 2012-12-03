class CreatePaymentsRooms < ActiveRecord::Migration
  def change
    create_table :payments_rooms do |t|
      t.references :payment
      t.references :room
      t.timestamps
    end
    add_index :payments_rooms, :payment_id
    add_index :payments_rooms, :room_id
  end
end
