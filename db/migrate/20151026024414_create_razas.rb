class CreateRazas < ActiveRecord::Migration
  def change
    create_table :razas do |t|

      t.timestamps
    end
  end
end
