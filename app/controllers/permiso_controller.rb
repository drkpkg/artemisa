class PermisoController < ApplicationController

  def list_all
    @grupo = Grupo.find_by(descripcion_grupo: params[:name])
    @permiso = Permiso.find_by(id: @grupo.permisos_id)
  end

end
