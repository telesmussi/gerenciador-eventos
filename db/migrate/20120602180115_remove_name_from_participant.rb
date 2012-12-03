class RemoveNameFromParticipant < ActiveRecord::Migration
  def up
    remove_column :participants, :surname
  end

  def down
    add_column :participants, :surname, :string
  end
end
