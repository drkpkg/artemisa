class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string specie_type
      t.timestamps
    end
  end
end
