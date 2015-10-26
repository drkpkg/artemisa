class CreateHistoricoClinicos < ActiveRecord::Migration
  def change
    create_table :historico_clinicos do |t|
      t.references :animal, index: true
      t.references :servicio, index: true
      t.text :observaciones

      t.timestamps
    end
  end
end
