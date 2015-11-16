class CreateProductoTipos < ActiveRecord::Migration
  def change
    create_table :producto_tipos do |t|
      t.string :nombre_tipo_producto
      t.timestamps
    end
  end
end
