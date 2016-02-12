class CreateDonacions < ActiveRecord::Migration
  def change
    create_table :donacions do |t|
      t.string :nombre
      t.integer :tipo #1 para dinero, 2 para general
      t.float :cantidad
      t.string :descripcion

      t.timestamps
    end
  end
end
