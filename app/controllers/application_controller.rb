require 'rbconfig'
require 'fileutils'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @path = "/tmp/artemisa/logs/"
  @actual_date_time = Time.new
  @log_path = "#{@path}log-#{@actual_date_time.day}-#{@actual_date_time.month}-#{@actual_date_time.year}.log"
  @log_msg = " "
  @log_username = " "

  def create_folder
    return true if FileUtils::mkdir_p @path
  end

  def create_log
    @new_log = File.new(@log_path,"a")
    return @log_path
  end

  def write_log(user="usuario", action="accion", modules="modulo")
    create_folder
    create_log
    @new_log.puts("#{user},#{action},#{modules},#{@actual_date_time}")
  end

  def dashboard
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

end
