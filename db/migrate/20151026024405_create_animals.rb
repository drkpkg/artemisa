class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :nombre
      t.float :alto
      t.float :largo
      t.float :peso
      t.date :fecha_nacimiento
      t.date :fecha_deceso
      t.belongs_to :raza, index: true
      t.belongs_to :cliente, index: true
      t.timestamps
    end
  end
end
