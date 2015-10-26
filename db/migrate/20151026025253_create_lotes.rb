class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|

      t.timestamps
    end
  end
end
