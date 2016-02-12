class CreateAdopcions < ActiveRecord::Migration
  def change
    create_table :adopcions do |t|
      t.string :nombre_persona
      t.string :identidad_persona
      t.references :animal, index: true
      t.timestamps
    end
  end
end
