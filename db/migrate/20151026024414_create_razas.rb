class CreateRazas < ActiveRecord::Migration
  def change
    create_table :razas do |t|
      t.string :nombre_raza
      t.belongs_to :especie, index: true
      t.timestamps
    end
  end
end
