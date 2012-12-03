class AddNameFantasy < ActiveRecord::Migration
  def change
    add_column :participants, :namefantasy, :string
  end
end
