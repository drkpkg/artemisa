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
      respond('200', 'En hora buena', 'Grupo modificado satisfactoriamente', 'success', '')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    group = Grupo.find_by(id: params[:id])
    if (group.delete)
      Usuario.update_group_index(params[:id])
      respond('200', 'En hora buena', 'grupo eliminado satisfactoriamente', 'success', '')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end
end
