class Breed < ActiveRecord::Base
  belongs_to :animal, dependent: destroy
  belongs_to :specie, dependent: destroy
end
