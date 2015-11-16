class Raza < ActiveRecord::Base
  belongs_to :especie

  validates_presence_of :nombre_raza, :especie_id, message: "Rellene los campos en blanco"
  validates_uniqueness_of :nombre_raza, message: "Raza ya existe en los datos"
end
