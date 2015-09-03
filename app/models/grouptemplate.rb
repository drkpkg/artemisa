class Grouptemplate < ActiveRecord::Base
  has_many :templates
  has_many :groups
end
