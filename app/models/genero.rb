class Genero < ActiveRecord::Base
  belongs_to :persona
  belongs_to :animal
end
