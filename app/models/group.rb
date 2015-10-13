class Group < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :grouptemplates

  validates_presence_of :group_name, message: 'Campo en blanco'
  validates_uniqueness_of :group_name, case_sensitive: false, message: 'El grupo ya existe'
end
