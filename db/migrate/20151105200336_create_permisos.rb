class CreatePermisos < ActiveRecord::Migration
  def change
    create_table :permisos do |t|
      t.text :data
      t.timestamps
    end
  end
end
