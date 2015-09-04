class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :father_last_name
      t.string :mother_last_name
      t.string :home_address
      t.belongs_to :group, index: true
      t.timestamps
    end
  end
end
