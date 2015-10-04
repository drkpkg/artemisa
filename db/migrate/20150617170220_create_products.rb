class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.float :product_price_buy
      t.float :product_price_sell
      t.belongs_to :product_type, index: true
      t.timestamps
    end
  end
end
