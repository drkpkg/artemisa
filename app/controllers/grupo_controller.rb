class GrupoController < ApplicationController
  def create
    group = Grupo.new
    group.descripcion_grupo = params[:descripcion_grupo]
    if group.valid?
      group.save()
      respond('200', 'En hora buena', 'Grupo creado satisfactoriamente', 'success', '')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    group = Group.find_by(id: params[:id])
    param_hash = {group_name: params[:group_name]}
    if group.update(param_hash)
      respond('200', 'En hora buena', 'Grupo modificado satisfactoriamente', 'success', '/users')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    group = Grupo.find_by(id: params[:id])
    if (group.delete)
      Usuario.update_group_index(params[:id])
      respond('200', 'En hora buena', 'grupo eliminado satisfactoriamente', 'success', '/users')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def permissions
    @grupo = Grupo.find_by(descripcion_grupo: params[:name])
  end

  def create_permissions
    grupo = Grupo.new
    grupo.data = params[:data]

  end

  def modify_permissions
    grupo = Grupo.find_by(id: params[:permiso])
    if grupo.update(data: params[:permiso][:data])
      flash[:success] = 'Se cambiaron los permisos correctamente'
    else
      flash[:error] = 'Error al cambiar los permisos'
    end
    redirect_to "/groups/#{grupo.descripcion_grupo}"
  end

end
