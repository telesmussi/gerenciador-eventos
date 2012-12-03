class AddCodClienteToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :cod_cliente, :string
  end
end
