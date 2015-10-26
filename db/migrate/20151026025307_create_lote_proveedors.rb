class CreateLoteProveedors < ActiveRecord::Migration
  def change
    create_table :lote_proveedors do |t|

      t.timestamps
    end
  end
end
