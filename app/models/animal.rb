class Animal < ActiveRecord::Base
  dragonfly_accessor :image
  has_one :genero
  has_one :especie
  belongs_to :cliente
  belongs_to :animal_servicio

  validates_presence_of :nombre, :alto, :largo, :peso, :cliente_id, :raza_id, :fecha_nacimiento, :genero_id, message: "Rellene campos en blanco"
end
