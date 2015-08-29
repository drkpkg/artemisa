require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  belongs_to :group
  #has_one :group

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |index|
        csv << index.attributes.values_at(*column_names)
      end
    end
  end

end
