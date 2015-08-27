class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_name
      t.string :department_description
      t.timestamps
    end
  end
end
