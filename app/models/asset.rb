require 'csv'
class Asset < ActiveRecord::Base

  has_one :employee
  has_one :asset_category
  has_many :maintenances

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |assets|
        csv << assets.attributes.values_at(*column_names)
      end
    end
  end
end
