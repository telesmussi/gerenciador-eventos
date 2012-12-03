class ChangeRoomPrice < ActiveRecord::Migration
  def up
    change_column :rooms, :price, :integer
  end

  def down
    change_column :rooms, :price, :float
  end
end
