class RenameCompanyParticipants < ActiveRecord::Migration
  change_table :participants do |t|
    t.rename :company, :company_name
  end
end
