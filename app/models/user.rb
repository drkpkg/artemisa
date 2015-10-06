require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  #relations
  has_one :person, dependent: :destroy
  belongs_to :group
  has_and_belongs_to_many :histories

  #Validations of presence and uniqueness
  validates_presence_of :username, :email, :password_digest, message: " Campos en blanco "
  validates_uniqueness_of :email, message: " Email ya existe "
  validates_uniqueness_of :username, message: " Usuario ya existe "

  #General validations
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message:  " Formato de email incorrecto "}
  validates :password_digest, length: {minimum: 5, message: " La contraseña tiene que tener más de 5 caracteres "}

  def self.update_group_index(group_id)
    User.where(group_id: group_id).update_all(group_id: 0)
  end

end
