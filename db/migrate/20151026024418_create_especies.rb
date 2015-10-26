class CreateEspecies < ActiveRecord::Migration
  def change
    create_table :especies do |t|

      t.timestamps
    end
  end
end
