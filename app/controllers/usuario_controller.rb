require 'bcrypt'
class UsuarioController < ApplicationController

  include BCrypt

  def create
    if params[:password] != params[:password_repeat]
      respond('400','Error','Contraseñas no coinciden','error','')
    else
      user = Usuario.new
      user.username = params[:username]
      user.password_digest = Password.create(params[:password])
      user.email = params[:email]
      user.state = params[:state]

      if user.valid?
        user.save
        respond('200', 'En hora buena', 'Usuario creado satisfactoriamente', 'success', '')
      else
        description = get_errors(user)
        respond('400', 'Error', description, 'error', '')
      end
    end
  end

  def modify
    user = Usuario.find_by(id: params[:id])
    param_list = Hash.new
    param_list[:username] = params[:username] if params[:username] != ''
    param_list[:password_digest] = Password.create(params[:password]) if params[:password] != ''
    param_list[:email] = params[:email] if params[:email] != ''
    param_list[:group_id] = params[:grupo] if params[:grupo] != ''
    param_list[:state] = params[:state] if params[:state] != ''

    if user.update(param_list)
      respond('200', 'En hora buena', 'Usuario modificado satisfactoriamente', 'success', '')
    else
      description = get_errors(user)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    user = Usuario.find_by(id: params[:id])
    if user.delete
      respond('200', 'En hora buena', 'Usuario eliminado satisfactoriamente', 'success', '/users')
    else
      respond('400', 'Error', 'Sucedió un error al eliminar el usuario', 'error', '')
    end
  end

  def list_all
    @usuarios = Usuario.all.select("Users.id, Users.username, Users.email, Users.group_id, Users.state")
  end

  def auth_user
    if !(cookies[:user_name] && cookies[:type])
      user = Usuario.find_by(username: params[:username])
      if user.state == false
        respond('400', 'Error', 'Usuario no habilitado para inicio de sesión', 'error', '')
      else
        if !user.blank? && Password.new(user.password_digest) == params[:password]
          cookies[:user_name] = user.username
          cookies[:user_id] = user.id
          cookies[:type] = user.group_id
          respond('200','Ingresando','Espere mientras se accede al sistema','','dashboard')
        else
          if params[:username] == '' || params[:password] == ''
            respond('200', 'Error', 'Por favor rellene los campos los campos vacíos', 'error', '')
          else
            respond('400', 'Error', 'Usuario o contraseña inválidos', 'error', '')
          end
        end
      end
    end
  end
end
