class Cliente < ActiveRecord::Base
  belongs_to :persona
  has_many :animals
end
