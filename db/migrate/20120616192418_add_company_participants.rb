class AddCompanyParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :company, :string
    add_column :participants, :cnpj, :string
    add_column :participants, :obs1, :string
    add_column :participants, :obs2, :string
  end
end
