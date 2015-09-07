class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  Bundler.require(*Rails.groups)
  Dotenv::Railtie.load

  protect_from_forgery with: :exception
  before_filter :set_cache_buster
  after_action :set_log_action

  def dashboardaction
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def set_log_action
    if (cookies[:user_name] && cookies[:type])
      actual_action = History.new
      actual_action.user_id = cookies[:user_name]
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

end
