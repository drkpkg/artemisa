class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|

      t.timestamps
    end
  end
end
