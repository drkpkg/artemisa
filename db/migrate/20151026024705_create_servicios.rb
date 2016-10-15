class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string  :servicio_uid
      t.string  :nombre_servicio
      t.string  :descripcion_servicio
      t.float   :precio
      t.timestamps
    end
  end
end
