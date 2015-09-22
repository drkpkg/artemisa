class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :person_name
      t.string :person_father_last_name
      t.string :person_mother_last_name
      t.string :person_address
      t.integer :person_phone
      t.integer :person_identity_number
      t.timestamps
    end
  end
end
