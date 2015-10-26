class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|

      t.timestamps
    end
  end
end
