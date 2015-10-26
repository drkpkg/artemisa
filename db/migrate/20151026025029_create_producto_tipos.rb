class CreateProductoTipos < ActiveRecord::Migration
  def change
    create_table :producto_tipos do |t|

      t.timestamps
    end
  end
end
