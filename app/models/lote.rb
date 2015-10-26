class Lote < ActiveRecord::Base
  has_many :productos
  belongs_to :lote_proveedor
end
