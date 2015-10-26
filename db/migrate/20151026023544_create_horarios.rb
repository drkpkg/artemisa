class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|

      t.timestamps
    end
  end
end
