class AnimalServicio < ActiveRecord::Base
  has_many :animal
  has_many :servicios
end
