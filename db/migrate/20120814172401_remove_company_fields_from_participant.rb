class RemoveCompanyFieldsFromParticipant < ActiveRecord::Migration
  change_table :participants do |t|
    t.remove :company_name, :namefantasy, :cnpj
  end
end
