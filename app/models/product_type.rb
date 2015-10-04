require 'csv'

class ProductType < ActiveRecord::Base
  validates :product_type_description, uniqueness: true
  has_many :products
end
