class VentaServicio < ActiveRecord::Base
  has_many :servicios
  has_many :ventas
end
