class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre_proveedor
      t.string :direccion
      t.string :email
      t.string :telefono
      t.timestamps
    end
  end
end
