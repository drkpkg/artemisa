class Servicio < ActiveRecord::Base
  dragonfly_accessor :servicio
  belongs_to :animal_servicio
  belongs_to :venta_servicio
  has_many :historico_clinicos

  validates_uniqueness_of :nombre_servicio, message: "Servicio ya existe"
  validates_presence_of :nombre_servicio, :descripcion_servicio, message: "Campos en blanco"
end
