class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.belongs_to :persona, index: true
      t.references :usuario, "id_usuario", index: true
      t.timestamps
    end
  end
end
