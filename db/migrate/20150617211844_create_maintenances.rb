class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :maintenance_description
      t.timestamps
    end
  end
end
