class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.belongs_to :group, index: true
      t.boolean :state
      t.timestamps
    end
  end
end
