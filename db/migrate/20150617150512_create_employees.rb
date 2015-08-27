class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_identity
      t.string :employee_name
      t.string :employee_direction
      t.belongs_to :office, index: true
      t.belongs_to :department, index: true
      t.timestamps
    end
  end
end
