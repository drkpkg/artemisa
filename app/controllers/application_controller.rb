require 'bifurcator'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Bifurcator

  before_filter :set_cache_buster
  before_filter :set_log_folder_and_file

  def dashboard
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def set_log_folder_and_file
    Bifurcator.create_folder
    Bifurcator.create_log
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def log_action(username, action, view)
    Bifurcator.write_log(username, action, view)
  end

end
