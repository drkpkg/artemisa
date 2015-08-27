class CreateAssetMaintenances < ActiveRecord::Migration
  def change
    create_table :asset_maintenances do |t|
      t.belongs_to :asset, index: true
      t.belongs_to :maintenance, index: true
      t.string :description
      t.timestamps
    end
  end
end
