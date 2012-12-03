class AddCompanyToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :company_id, :integer
    add_index :participants, :company_id
  end
end
