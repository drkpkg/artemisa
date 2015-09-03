class CreateGrouptemplates < ActiveRecord::Migration
  def change
    create_table :grouptemplates do |t|
      t.belongs_to :templates, index: true
      t.belongs_to :groups, index: true
      t.boolean :permission_write
      t.boolean :permission_modify
      t.boolean :permission_read
      t.boolean :permission_delete
      t.timestamps
    end
  end
end
