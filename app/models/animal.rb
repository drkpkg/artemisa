class Animal < ActiveRecord::Base
  has_one :especie
  belongs_to :cliente
  belongs_to :animal_servicio
end
