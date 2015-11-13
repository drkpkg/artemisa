class CreateEspecies < ActiveRecord::Migration
  def change
    create_table :especies do |t|
      t.string :nombre_especie
      t.references :raza, index: true
      t.timestamps
    end
  end
end
