class CreateGrouptemplates < ActiveRecord::Migration
  def change
    create_table :grouptemplates do |t|
      t.belongs_to :group, index: true
      t.belongs_to :template, index: true

      t.timestamps
    end
  end
end
