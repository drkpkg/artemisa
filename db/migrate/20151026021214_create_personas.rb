class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :image
      t.string :nombre
      t.string :ap_paterno
      t.string :ap_materno
      t.date   :fecha_nacimiento
      t.string :identificacion
      t.string :correo
      t.string :direccion
      t.string :telefono
      t.references :genero, index: true
      t.belongs_to :persona_tipos, index: true
      t.timestamps
    end
  end
end
