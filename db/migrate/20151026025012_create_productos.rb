class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :marca_producto
      t.string :nombre_producto
      t.float :precio_total
      t.date :fecha_vencimiento
      t.belongs_to :producto_tipo, index: true
      t.belongs_to :lotes, index: true
      t.timestamps
    end
  end
end
