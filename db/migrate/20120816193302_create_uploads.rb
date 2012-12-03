class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :event
      t.references :user

      t.timestamps
    end
    add_index :uploads, :event_id
    add_index :uploads, :user_id
  end
end
