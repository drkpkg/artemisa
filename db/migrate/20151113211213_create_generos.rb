class CreateGeneros < ActiveRecord::Migration
  def change
    create_table :generos do |t|
      t.string :genero
      t.timestamps
    end
  end
end
