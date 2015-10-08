require 'csv'

class ProductType < ActiveRecord::Base
  validates_presence_of :product_type_description, message: 'Campo en blanco'
  validates_uniqueness_of :product_type_description, message: 'Tipo de producto ya existe'
  has_many :products
end
