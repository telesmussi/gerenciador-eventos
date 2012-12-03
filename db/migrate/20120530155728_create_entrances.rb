class CreateEntrances < ActiveRecord::Migration
  def change
    create_table :entrances do |t|
      t.references :credential
      t.references :room
      t.boolean :was_allowed

      t.timestamps
    end
    add_index :entrances, :credential_id
    add_index :entrances, :room_id
  end
end
