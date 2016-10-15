class Information < ActiveRecord::Base
  dragonfly_accessor :logo
  dragonfly_accessor :login_image

  validates_presence_of :name, :phone, :email, :description, :address, message: 'Campos en blanco'
end
