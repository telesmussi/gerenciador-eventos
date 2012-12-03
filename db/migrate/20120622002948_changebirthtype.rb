class Changebirthtype < ActiveRecord::Migration
  def up
    change_column :participants, :birth, :string
  end

  def down
    change_column :participants, :birth, :date
  end
end
