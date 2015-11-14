class CreatePersonaTipos < ActiveRecord::Migration
  def change
    create_table :persona_tipos do |t|
      t.string :tipo
      t.timestamps
    end
  end
end
