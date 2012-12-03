class CredentialsChangeColumnBarcode < ActiveRecord::Migration
  def up
    change_column :credentials, :bar_code, :integer
  end

  def down
    change_column :credentials, :bar_code, :string
  end
end
