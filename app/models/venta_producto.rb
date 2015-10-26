class VentaProducto < ActiveRecord::Base
  has_many :ventas
  has_many :productos
end
