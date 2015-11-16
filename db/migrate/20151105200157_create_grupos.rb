class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :descripcion_grupo
      t.belongs_to :permisos, index: true
      t.timestamps
    end
  end
end
