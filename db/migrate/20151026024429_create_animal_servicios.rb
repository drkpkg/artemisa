class CreateAnimalServicios < ActiveRecord::Migration
  def change
    create_table :animal_servicios do |t|

      t.timestamps
    end
  end
end
