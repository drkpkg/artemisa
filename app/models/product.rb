require 'csv'
class Product < ActiveRecord::Base

  belongs_to :product_type
  validates_presence_of :product_name, :product_description, :product_price_buy, :product_price_sell, message: 'Por favor rellene los campos los campos vacíos'

  def self.update_product_type_index(product_id)
    Product.where(category_id: product_id).update_all(product_id: 0)
  end
end
