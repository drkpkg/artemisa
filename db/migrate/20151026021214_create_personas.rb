class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :imagen
      t.string :nombre
      t.string :ap_materno
      t.string :ap_paterno
      t.string :identificacion
      t.string :correo
      t.string :direccion
      t.string :telefono
      t.belongs_to :usuario, index: true
      t.timestamps
    end
  end
end
