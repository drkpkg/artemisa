class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.float :precio_total
      t.references :cliente, index: true
      t.references :historico_clinico, index: true
      t.references :@cliente, "vendedor_id", index: true

      t.timestamps
    end
  end
end
