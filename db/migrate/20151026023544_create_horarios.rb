class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.time :horario_entrada
      t.time :horario_salida
      t.timestamps
    end
  end
end
