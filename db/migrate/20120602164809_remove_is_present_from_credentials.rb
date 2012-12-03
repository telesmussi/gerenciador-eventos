class RemoveIsPresentFromCredentials < ActiveRecord::Migration
  def up
    remove_column :credentials, :is_present
  end

  def down
    add_column :credentials, :is_present, :boolean
  end
end
