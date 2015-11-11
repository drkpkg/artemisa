class PermisoController < ApplicationController

  def list_all
    permisos = Permiso.all
  end

end
