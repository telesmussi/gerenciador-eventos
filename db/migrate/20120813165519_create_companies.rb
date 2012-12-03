class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :fantasy_name
      t.string :cnpj

      t.timestamps
    end
  end
end
