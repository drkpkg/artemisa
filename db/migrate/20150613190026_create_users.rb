class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.belongs_to :empleado, index: true
      t.belongs_to :group, index: true
      t.integer :usertype
      t.timestamps
    end
  end
end
