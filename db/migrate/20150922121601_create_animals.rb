class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.belongs_to :breed, index: true
      t.timestamps
    end
  end
end
