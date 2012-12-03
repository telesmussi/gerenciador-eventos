class AddIsCompaniesEventToEvents < ActiveRecord::Migration
  def change
    add_column :events, :is_company_event, :bool
  end
end
