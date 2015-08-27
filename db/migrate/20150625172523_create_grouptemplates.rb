class CreateGrouptemplates < ActiveRecord::Migration
  def change
    create_table :grouptemplates do |t|
      t.belongs_to :group, index: true
      t.belongs_to :template, index: true
      t.boolean :permission_write
      t.boolean :permission_modify
      t.boolean :permission_read
      t.boolean :permission_delete
      t.timestamps
    end
  end
end
