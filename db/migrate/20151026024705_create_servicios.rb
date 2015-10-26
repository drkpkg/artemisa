class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :nombre_servicio
      t.string :descripcion_servicio
      t.references :empleado, "empleado_id", index: true
      t.references :empleado, "vendedor_id", index: true
      t.timestamps
    end
  end
end
