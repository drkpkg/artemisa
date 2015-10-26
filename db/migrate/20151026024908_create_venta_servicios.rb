class CreateVentaServicios < ActiveRecord::Migration
  def change
    create_table :venta_servicios do |t|
      t.references :servicios, "servicio_id", index: true
      t.references :venta, "venta_id", index: true
      t.timestamps
    end
  end
end
