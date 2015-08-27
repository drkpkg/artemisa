class CreateCurrencyExchanges < ActiveRecord::Migration
  def change
    create_table :currency_exchanges do |t|

      t.timestamps
    end
  end
end
