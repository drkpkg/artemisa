class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|

      t.timestamps
    end
  end
end
