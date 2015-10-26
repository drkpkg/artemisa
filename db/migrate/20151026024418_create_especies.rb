class CreateEspecies < ActiveRecord::Migration
  def change
    create_table :especies do |t|
      t.string :nombre_especie
      t.belongs_to :raza, index: true
      t.timestamps
    end
  end
end
