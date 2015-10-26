class CreateVentaServicios < ActiveRecord::Migration
  def change
    create_table :venta_servicios do |t|

      t.timestamps
    end
  end
end
