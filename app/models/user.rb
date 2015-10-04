require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  has_one :person, dependent: :destroy
  belongs_to :group
  has_and_belongs_to_many :histories
  validates_uniqueness_of :email

  def self.update_group_index(group_id)
    User.where(group_id: group_id).update_all(group_id: 0)
  end

end
