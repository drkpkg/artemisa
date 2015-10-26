class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
      t.belongs_to :persona, index: true
      t.references :empleado_tipo, index: true
      t.timestamps
    end
  end
end
