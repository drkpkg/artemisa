require 'csv'

class Usuario < ActiveRecord::Base
  has_secure_password
  #relations
  has_one :persona, dependent: :destroy
  #belongs_to :group
  belongs_to :bitacora

  #Validations of presence and uniqueness
  validates_presence_of :nombre_usuario, :password_digest, message: " Campos en blanco "
  #validates_uniqueness_of :email, message: " Email ya existe "
  validates_uniqueness_of :nombre_usuario, message: " Usuario ya existe "

  #General validations
  #validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message:  " Formato de email incorrecto "}
  validates :password_digest, length: {in: 4..20, message: " La contraseña tiene que tener más de 4 caracteres "}

  def self.update_group_index(group_id)
    Usuario.where(group_id: group_id).update_all(group_id: 0)
  end

end
