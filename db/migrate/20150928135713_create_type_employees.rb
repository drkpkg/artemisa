class CreateTypeEmployees < ActiveRecord::Migration
  def change
    create_table :type_employees do |t|
      t.string :type_employee
      t.timestamps
    end
  end
end
