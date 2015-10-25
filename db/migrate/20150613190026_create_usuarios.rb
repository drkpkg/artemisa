class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.belongs_to :grupo, index: true
      t.boolean :state
      t.timestamps
    end
  end
end
