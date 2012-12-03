class AddPhotoIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :photo_id, :integer
    add_index :events, :photo_id
  end
end
