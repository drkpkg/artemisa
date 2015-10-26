class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|

      t.timestamps
    end
  end
end
