class LoteProveedor < ActiveRecord::Base
  has_many :proveedors
  has_many :lotes
end
