class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|

      t.timestamps
    end
  end
end
