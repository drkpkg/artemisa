require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  has_one :person, dependent: :destroy
  belongs_to :group
  has_and_belongs_to_many :histories
  validates_uniqueness_of :email

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |index|
        csv << index.attributes.values_at(*column_names)
      end
    end
  end

  def self.update_group_index(group_id)
    User.where(group_id: group_id).update_all(group_id: 0)
  end

end
