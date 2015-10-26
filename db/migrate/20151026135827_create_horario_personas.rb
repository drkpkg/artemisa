class CreateHorarioPersonas < ActiveRecord::Migration
  def change
    create_table :horario_personas do |t|
      t.references :usuario, index: true
      t.references :persona, index: true
      t.timestamps
    end
  end

  def down
    change_table :horario_personas do |t|
      t.remove :user_id
      t.remove :persona_id
    end
  end
end
