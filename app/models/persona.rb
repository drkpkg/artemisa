class Persona < ActiveRecord::Base

  dragonfly_accessor :image
  belongs_to :horario_persona
  has_one :usuario
  has_one :genero
  has_one :persona_tipo

  validates_presence_of :nombre, :ap_materno, :ap_paterno, :correo, :identificacion, :direccion, :telefono, message: "Rellene los campos vacíos"
  validates_uniqueness_of :correo, message: "Correo en uso"
  validates_uniqueness_of :telefono, message: "Teléfono en uso"
  validates_uniqueness_of :identificacion, message: "Identificación en uso"
end
