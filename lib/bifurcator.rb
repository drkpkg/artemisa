require 'rbconfig'
require 'fileutils'

module Bifurcator

  @path = "/tmp/artemisa/logs/"
  @actual_date_time = Time.new
  @log_path = "#{@path}log-#{@actual_date_time.day}-#{@actual_date_time.month}-#{@actual_date_time.year}.log"

  def self.create_folder
    return true if FileUtils::mkdir_p @path
  end

  def self.create_log
    @new_log = File.new(@log_path,"a")
    return @log_path
  end

  def self.write_log(user="usuario", action="accion", modules="modulo")
    @new_log.puts("#{user},#{action},#{modules},#{@actual_date_time}")
  end

end