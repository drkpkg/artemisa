class Group < ActiveRecord::Base
  has_many :users
  belongs_to :grouptemplate
  #has_and_belongs_to_many :templates
end
