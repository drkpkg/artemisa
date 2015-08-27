require 'csv'

class Employee < ActiveRecord::Base

  has_one :office
  belongs_to :department

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |index|
        csv << index.attributes.values_at(*column_names)
      end
    end
  end
end
