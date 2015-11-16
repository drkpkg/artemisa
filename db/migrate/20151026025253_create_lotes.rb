class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.string :lote
      t.integer :cantidad_lote
      t.integer :cantidad_minima
      t.timestamps
    end
  end
end
