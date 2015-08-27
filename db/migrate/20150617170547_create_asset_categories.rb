class CreateAssetCategories < ActiveRecord::Migration
  def change
    create_table :asset_categories do |t|
      t.string :asset_category_description
      t.integer :asset_categories_years
      t.float :asset_categories_coefficient
      t.timestamps
    end
  end
end
