require 'csv'
class Product < ActiveRecord::Base

  belongs_to :product_type

  def self.update_product_type_index(product_id)
    Product.where(category_id: product_id).update_all(product_id: 0)
  end
end
