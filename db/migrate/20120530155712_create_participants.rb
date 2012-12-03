class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :surname
      t.date :birth
      t.references :address
      t.string :main_phone
      t.string :secondary_phone
      t.string :cpf
      t.string :email
      t.string :sex
      t.string :occupation
      t.string :marital_status

      t.timestamps
    end
    add_index :participants, :address_id
  end
end
