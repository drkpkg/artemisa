require 'bcrypt'
class UserController < ApplicationController

  include BCrypt

  def login
    if !(cookies[:user_name] && cookies[:type])
      render layout: 'login'
    else
      redirect_to dashboard_path
    end
  end

  def admin
    if User.exists?(username: 'admin')
      redirect_to root_path
    else
      render layout: 'admin'
    end
  end

  def auth_user
    if !(cookies[:user_name] && cookies[:type])
      user = User.find_by(username: params[:username])
      if !user.blank? && Password.new(user.password_digest) == params[:password]
        cookies[:user_name] = user.username
        cookies[:user_id] = user.id
        cookies[:type] = user.usertype
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

  def create
    if params[:username] == '' || params[:password] == '' || params[:password_repeat] == ''
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
          user.usertype = params[:type]
          if user.save
            if params[:username] == 'admin'
              page = '/'
            else
              page = 'list_all'
            end

            respond_to do |format|
              msg = { :status => "200", title: 'En hora buena', description: 'Usuario creado satisfactoriamente', type: 'success', redirect_page: page}
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
    if params[:password] == '' && params[:password_repeat] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      if params[:password] != params[:password_repeat]
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Las contraseñas no coinciden', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      else
        user = User.find_by(id: params[:id])
        if user.update(password: params[:password])
          respond_to do |format|
            msg = { :status => "200", title: 'En hora buena', description: 'Usuario modificado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
            format.json  { render :json => msg }
          end
        else
          respond_to do |format|
            msg = { :status => "400", title: 'Error', description: 'Sucedió un error al modificar el usuario', type: 'error', redirect_page: ''}
            format.json  { render :json => msg }
          end
        end
      end
    end
  end

  def delete
    user = User.find_by(id: params[:id])
    if user.delete
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Usuario eliminado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
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
    @user = User.all
  end

  def logout
    cookies.delete :user_name
    cookies.delete :user_id
    cookies.delete :type
    redirect_to root_path
  end

end
