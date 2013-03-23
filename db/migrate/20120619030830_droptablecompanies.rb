class Droptablecompanies < ActiveRecord::Migration
  def up
    drop_table :companies
  end

  def down
  end
end
