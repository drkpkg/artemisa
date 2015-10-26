class CreateHistoricoClinicos < ActiveRecord::Migration
  def change
    create_table :historico_clinicos do |t|

      t.timestamps
    end
  end
end
