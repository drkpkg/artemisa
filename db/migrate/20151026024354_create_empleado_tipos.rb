class CreateEmpleadoTipos < ActiveRecord::Migration
  def change
    create_table :empleado_tipos do |t|
      t.string :cargo
      t.timestamps
    end
  end
end
