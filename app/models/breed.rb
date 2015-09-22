class Breed < ActiveRecord::Base
  belongs_to :specie, dependent: destroy
end
