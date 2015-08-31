class CreateAssetCategories < ActiveRecord::Migration
  def change
    create_table :asset_categories do |t|
      t.string :asset_category_description
      t.timestamps
    end
  end
end
