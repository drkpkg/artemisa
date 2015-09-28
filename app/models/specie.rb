class Specie < ActiveRecord::Base
  #belongs_to :animals
  has_many :breeds
end
