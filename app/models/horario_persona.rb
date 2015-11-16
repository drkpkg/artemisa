class HorarioPersona < ActiveRecord::Base
  has_many :horarios
  has_many :personas
end
