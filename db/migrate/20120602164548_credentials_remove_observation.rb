class CredentialsRemoveObservation < ActiveRecord::Migration
  def up
    remove_column :credentials, :observation
  end

  def down
    add_column :credentials, :observaton, :string
  end
end
