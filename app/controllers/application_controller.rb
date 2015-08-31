require 'bifurcator'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Bifurcator

  def dashboard
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def log_action(username, action, view)
    Bifurcator.create_folder
    Bifurcator.create_log
    Bifurcator.write_log(username, action, view)
  end

end
