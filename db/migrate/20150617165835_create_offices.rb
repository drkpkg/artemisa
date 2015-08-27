class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :office_description
      t.timestamps
    end
  end
end
