class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.belongs_to :persona, index: true
      t.references :empleado_tipo, "id_empleado", index: true
      t.references :usuario, "id_usuario", index: true
      t.timestamps
    end
  end
end
