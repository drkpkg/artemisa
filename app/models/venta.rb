class Venta < ActiveRecord::Base
  belongs_to :venta_servicio
  belongs_to :venta_producto
end
