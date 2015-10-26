class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.datetime :horario_entrada
      t.datetime :horario_salida
      t.timestamps
    end
  end
end
