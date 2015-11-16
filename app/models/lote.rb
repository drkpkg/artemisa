class Lote < ActiveRecord::Base
  has_many :productos
  belongs_to :lote_proveedor

  validates_presence_of :lote, :cantidad_lote, :cantidad_minima, message: "Rellene los campos en blanco"
  validates_uniqueness_of :lote, message: "Lote ya existente"
end
