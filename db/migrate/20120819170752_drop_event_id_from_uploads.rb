class DropEventIdFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :event_id
  end
end
