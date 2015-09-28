class CreateTypeServices < ActiveRecord::Migration
  def change
    create_table :type_services do |t|

      t.timestamps
    end
  end
end
