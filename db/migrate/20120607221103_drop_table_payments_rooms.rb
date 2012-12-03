class DropTablePaymentsRooms < ActiveRecord::Migration
  def up
    drop_table :payments_rooms
  end

  def down
  end
end
