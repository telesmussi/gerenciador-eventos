class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep

      t.timestamps
    end
  end
end
