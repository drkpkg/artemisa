class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :template_name
      t.boolean :permission_write
      t.boolean :permission_modify
      t.boolean :permission_read
      t.boolean :permission_delete
      t.timestamps
    end
  end
end
