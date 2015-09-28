class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :breed_type
      t.belongs_to :specie, index: true
      t.timestamps
    end
  end
end
