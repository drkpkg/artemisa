class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :descripcion_grupo
      t.text :data
      t.timestamps
    end
  end
end
