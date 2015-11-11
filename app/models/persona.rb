class Persona < ActiveRecord::Base

  attachment :imagen_perfil, type: image
  has_one :usuario
  belongs_to :horario_persona
  has_one :cliente
  has_one :empleado
  validates_presence_of :nombre, :ap_materno, :ap_paterno, :correo, :identificacion, :direccion, :telefono, message: "Rellene los campos vacíos"
  validates_uniqueness_of :correo, message: "Correo en uso"
  validates_uniqueness_of :telefono, message: "Teléfono en uso"
  validates_uniqueness_of :identificacion, message: "Identificación en uso"
end
