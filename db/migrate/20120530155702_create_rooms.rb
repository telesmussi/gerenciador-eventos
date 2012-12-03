class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :event
      t.integer :limit
      t.float :price

      t.timestamps
    end
    add_index :rooms, :event_id
  end
end
