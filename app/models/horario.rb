class Horario < ActiveRecord::Base
  belongs_to :horario_persona

  validates_presence_of :horario_entrada, :horario_salida, message: "Rellene los campos en blanco"
end
