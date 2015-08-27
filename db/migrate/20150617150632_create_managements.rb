class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|

      t.timestamps
    end
  end
end
