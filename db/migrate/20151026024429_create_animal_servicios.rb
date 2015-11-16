class CreateAnimalServicios < ActiveRecord::Migration
  def change
    create_table :animal_servicios do |t|
      t.references :animal, index: true
      t.references :servicio, index: true
      t.timestamps
    end
  end
end
