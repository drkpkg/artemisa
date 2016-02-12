class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :logo_uid
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.boolean :bunker, default: false
      t.timestamps
    end
  end
end
