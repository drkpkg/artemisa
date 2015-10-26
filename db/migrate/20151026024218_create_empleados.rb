class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|

      t.timestamps
    end
  end
end
