class Specie < ActiveRecord::Base
  has_many :animals
  has_many :breeds
end
