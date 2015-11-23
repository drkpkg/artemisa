class Grupo < ActiveRecord::Base
  has_many :usuarios

  validates_presence_of :descripcion_grupo, message: "Rellene el campo vacío"
  validates_uniqueness_of :descripcion_grupo, case_sensitive: false, message: "Grupo ya existe"
end
