require 'csv'
class Asset < ActiveRecord::Base

  belongs_to :asset_category

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |assets|
        csv << assets.attributes.values_at(*column_names)
      end
    end
  end

  def self.update_asset_category_index(asset_id)
    Asset.where(category_id: asset_id).update_all(category_id: 0)
  end
end
