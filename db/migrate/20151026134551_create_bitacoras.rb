class CreateBitacoras < ActiveRecord::Migration
  def change
    create_table :bitacoras do |t|
      t.belongs_to :usuario, index: true
      t.string :action
      t.string :view
      t.timestamps
    end
  end
end
