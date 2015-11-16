class Especie < ActiveRecord::Base
  belongs_to :animal
  has_many :razas

  validates_presence_of :nombre_especie, message: "Rellene los campos en blanco"
  validates_uniqueness_of :nombre_especie, message: "Especie ya existe en los datos"

end
