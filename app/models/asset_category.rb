require 'csv'

class AssetCategory < ActiveRecord::Base
  validates :asset_category_description, uniqueness: true
  has_many :assets

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |index|
        csv << index.attributes.values_at(*column_names)
      end
    end
  end
end
