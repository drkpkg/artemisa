class CreateVentaProductos < ActiveRecord::Migration
  def change
    create_table :venta_productos do |t|

      t.timestamps
    end
  end
end
