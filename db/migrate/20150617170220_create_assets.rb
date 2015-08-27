class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_name
      t.string :asset_description
      t.date :asset_date_buy
      t.float :asset_price_buy
      t.float :asset_price_actual
      t.belongs_to :category, index: true
      t.belongs_to :employee, index: true
      t.timestamps
    end
  end
end
