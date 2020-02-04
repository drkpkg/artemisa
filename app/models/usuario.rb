require 'csv'

class Usuario < ActiveRecord::Base
  has_secure_password

  #relations
  belongs_to :persona, dependent: :destroy
  belongs_to :grupo
  belongs_to :bitacora

  #Validations of presence and uniqueness
  validates_presence_of :nombre_usuario, :password_digest, message: " Campos en blanco "
  validates_uniqueness_of :nombre_usuario, message: " Usuario ya existe "
  #validates :password_digest, length: {minimum: 4, message: " La contraseña tiene que tener más de 4 caracteres "}

  def self.update_group_index(group_id)
    Usuario.where(grupo_id: group_id).update_all(grupo_id: 0)
  end

end
