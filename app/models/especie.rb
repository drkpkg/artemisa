class Especie < ActiveRecord::Base
  belongs_to :animal
  has_many :razas
end
