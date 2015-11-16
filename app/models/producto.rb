class Producto < ActiveRecord::Base
  belongs_to :venta_producto
  belongs_to :lote
  has_one :producto_tipo

  validates_presence_of :marca_producto, :nombre_producto, :precio_total, :fecha_vencimiento, :producto_tipo_id, :lotes_id, message: "Rellene los campos vacios"
end
