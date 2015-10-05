class Group < ActiveRecord::Base
  has_many :users
  belongs_to :grouptemplate
  validates_uniqueness_of :group_name, case_sensitive: false
  #has_and_belongs_to_many :templates
end
