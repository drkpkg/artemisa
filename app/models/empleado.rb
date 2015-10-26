class Empleado < ActiveRecord::Base
  belongs_to :persona
  has_one :empleado_tipo
end
