class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.timestamps
    end
  end
end
