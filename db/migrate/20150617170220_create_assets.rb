class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_name
      t.string :asset_description
      t.float :asset_price_buy
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
