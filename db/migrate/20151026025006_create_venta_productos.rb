class CreateVentaProductos < ActiveRecord::Migration
  def change
    create_table :venta_productos do |t|
      t.references :ventas, index: true
      t.integer :cantidad
      t.float :precio_total

      t.timestamps
    end
  end
end
