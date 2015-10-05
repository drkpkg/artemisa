require 'bcrypt'
class UserController < ApplicationController

  include BCrypt

  def create
    if params[:username] == '' || params[:password] == '' || params[:password_repeat] == '' || params[:email] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      if !User.find_by(username: params[:username]).blank?
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'El usuario ya existe', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      else
        if params[:password] != params[:password_repeat]
          respond_to do |format|
            msg = { :status => "400", title: 'Error', description: 'Contraseñas no coinciden', type: 'error', redirect_page: ''}
            format.json  { render :json => msg }
          end
        else
          user = User.new
          user.username = params[:username]
          user.password_digest = Password.create(params[:password])
          user.email = params[:email]
          user.state = params[:state]

          if user.save
            respond_to do |format|
              msg = { :status => "200", title: 'En hora buena', description: 'Usuario creado satisfactoriamente', type: 'success', redirect_page: '/users'}
              format.json  { render :json => msg }
            end
          else
            respond_to do |format|
              msg = { :status => "400", title: 'Error', description: 'Error al crear usuario', type: 'error', redirect_page: ''}
              format.json  { render :json => msg }
            end
          end
        end
      end
    end
  end

  def modify
    user = User.find_by(id: params[:id])
    param_list = Hash.new
    param_list[:username] = params[:username] if params[:username] != ''
    param_list[:password_digest] = Password.create(params[:password]) if params[:password] != ''
    param_list[:email] = params[:email] if params[:email] != ''
    param_list[:group_id] = params[:group] if params[:group] != ''
    param_list[:state] = params[:state] if params[:state] != ''

    if user.update(param_list)
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Usuario modificado satisfactoriamente', type: 'success', redirect_page: '/users'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Sucedió un error al modificar el usuario', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end

  def delete
    user = User.find_by(id: params[:id])
    if user.delete
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Usuario eliminado satisfactoriamente', type: 'success', redirect_page: '/users'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Sucedió un error al eliminar el usuario', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end

  def list_all
    @user = User.all.select("Users.id, Users.username, Users.email, Users.group_id, Users.state")
  end

  def auth_user
    if !(cookies[:user_name] && cookies[:type])
      user = User.find_by(username: params[:username])

      if !user.blank? && Password.new(user.password_digest) == params[:password]
        cookies[:user_name] = user.username
        cookies[:user_id] = user.id
        cookies[:type] = user.group_id

        respond_to do |format|
          msg = { :status => "200", redirect_page: 'dashboard'}
          format.json  { render :json => msg }
        end
      else
        if params[:username] == '' || params[:password] == ''
          respond_to do |format|
            msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
            format.json  { render :json => msg }
          end
        else
          respond_to do |format|
            msg = { :status => "400", title: 'Error', description: 'Usuario o contraseña inválidos', type: 'error', redirect_page: ''}
            format.json  { render :json => msg }
          end
        end
      end
    end
  end
end
