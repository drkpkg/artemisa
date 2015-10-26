class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.integer :cantidad_lote
      t.integer :cantidad_minima
      t.float :precio_lote
      t.timestamps
    end
  end
end
