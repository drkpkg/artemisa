require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  has_one :employee
  has_one :groups

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |index|
        csv << index.attributes.values_at(*column_names)
      end
    end
  end

end
