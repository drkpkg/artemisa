class Breed < ActiveRecord::Base
  belongs_to :animal, dependent: :destroy
  belongs_to :specie, dependent: :destroy
  validates_uniqueness_of :breed_type, message: "Raza ya existe"
end
