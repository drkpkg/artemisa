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
end
