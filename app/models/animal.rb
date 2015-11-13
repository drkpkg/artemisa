class Animal < ActiveRecord::Base
  has_one :genero
  has_one :raza
  belongs_to :cliente
  belongs_to :animal_servicio
end
