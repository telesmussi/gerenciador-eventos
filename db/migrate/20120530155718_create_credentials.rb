class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.references :participant
      t.references :event
      t.boolean :is_present
      t.string :bar_code
      t.string :observation

      t.timestamps
    end
    add_index :credentials, :participant_id
    add_index :credentials, :event_id
  end
end
