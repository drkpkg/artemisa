class CreateLoteProveedors < ActiveRecord::Migration
  def change
    create_table :lote_proveedors do |t|
      t.references :@cliente, "empleado_id", index: true
      t.references :lote, "lote_id", index: true
      t.references :proveedor, "proveedor_id", index: true
      t.timestamps
    end
  end
end
