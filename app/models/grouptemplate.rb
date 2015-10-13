class Grouptemplate < ActiveRecord::Base
  has_many :templates
  has_and_belongs_to_many :groups
end
