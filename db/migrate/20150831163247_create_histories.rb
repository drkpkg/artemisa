class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.belongs_to :user, index: true
      t.string :action
      t.string :view
      t.timestamps
    end
  end
end
