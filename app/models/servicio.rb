class Servicio < ActiveRecord::Base
  belongs_to :animal_servicio
  belongs_to :venta_servicio
  has_many :historico_clinicos
end
