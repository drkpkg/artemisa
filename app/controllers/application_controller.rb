class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #Bundler.require(*Rails.groups)
  #Dotenv::Railtie.load

  protect_from_forgery with: :exception
  before_filter :set_cache_buster
  after_action :set_log_action

  def set_log_action
    if (cookies[:user_name] && cookies[:type])
      actual_action = Bitacora.new
      actual_action.usuario_id = cookies[:user_id]
      actual_action.action = "#{action_name}"
      actual_action.view = "#{controller_name}"
      actual_action.save
    end
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def login
    if !(cookies[:user_name] && cookies[:type])
      render layout: 'login'
    else
      redirect_to dashboard_path
    end
  end

  def logout
    cookies.delete :user_name
    cookies.delete :user_id
    cookies.delete :type
    redirect_to root_path
  end

  def get_errors(object_controller)
    object_controller.errors.messages.each do |actual|
      return actual[1].to_s.gsub!('["','').gsub!('"]','') + "\n"
      break
    end
  end

  def respond(status, title, description, type, redirect_page)
    respond_to do |format|
      msg = {status: status, title: title, description: description, type: type, redirect_page: redirect_page}
      format.json { render :json => msg }
    end
  end

  def verify_cookies(path)
    if (cookies[:user_name].nil? && cookies[:type].nil?)
      render layout: 'login'
    else
      redirect_to path
    end
  end

end
