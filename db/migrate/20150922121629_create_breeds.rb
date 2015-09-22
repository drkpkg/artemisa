class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|

      t.timestamps
    end
  end
end
