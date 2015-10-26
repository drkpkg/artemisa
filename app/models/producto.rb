class Producto < ActiveRecord::Base
  belongs_to :venta_producto
  belongs_to :lote
  has_one :producto_tipo
end
