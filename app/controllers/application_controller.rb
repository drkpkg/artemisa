class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end
end
