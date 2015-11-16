require 'bcrypt'
class UsuarioController < ApplicationController

  include BCrypt

  def create
    #if params[:password] != params[:password_repeat]
    #  respond('400','Error','Contraseñas no coinciden','error','')
    #else
      user = Usuario.new
      user.nombre_usuario = params[:username]
      user.password_digest = Password.create(params[:password])
      user.state = params[:state]

      if user.valid?
        user.save
        respond('200', 'En hora buena', 'Usuario creado satisfactoriamente', 'success', '')
      else
        description = get_errors(user)
        respond('400', 'Error', description, 'error', '')
      end
    #end
  end

  def modify
    user = Usuario.find_by(id: params[:id])
    param_list = Hash.new
    param_list[:nombre_usuario] = params[:username] if params[:username] != ''
    param_list[:password_digest] = Password.create(params[:password]) if params[:password] != ''
    param_list[:grupo_id] = params[:group] if params[:group] != ''
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
    @usuarios = Usuario.all
    #joins(:grupo).select("Usuarios.id, nombre_usuario, state, Grupos.descripcion_grupo")
  end

  def auth_user
    if !(cookies[:user_name] && cookies[:type])
      user = Usuario.find_by(nombre_usuario: params[:nombre_usuario])
      if !user.blank? && Password.new(user.password_digest) == params[:clave]
        if user.state == false
          flash[:error] = 'Usuario no habilitado para inicio de sesión'
          redirect_to root_url
        else
          cookies[:user_name] = user.nombre_usuario
          cookies[:user_id] = user.id
          cookies[:type] = user.grupo_id
          redirect_to dashboard_path
        end
      else
        if params[:nombre_usuario] == '' || params[:clave] == ''
          flash[:error] = 'Por favor rellene los campos los campos vacíos'
          redirect_to root_path
        else
          flash[:error] = 'Usuario o contraseña inválidos'
          redirect_to root_path
        end
      end
    end
  end
end
