class Specie < ActiveRecord::Base
  #belongs_to :animals
  has_many :breeds
  validates_uniqueness_of :specie_type, message: "Especie ya existe"
end
