class Information < ActiveRecord::Base
  dragonfly_accessor :logo
  validates_presence_of :address, :email, :name, :phone, message: "Campos en blanco"

  validates_presence_of :name, :phone, :email, :description, :address, message: 'Campos en blanco'
end
