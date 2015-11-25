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
    @permiso_object = JSON.parse @grupo.data
  end

  def create_permissions
    grupo = Grupo.new
    grupo.data = params[:data]

  end

  def modify_permissions
    grupo = Grupo.find_by(id: params[:permiso][:grupo])
    #parsing json
    data = parse_json(grupo.data, params[:permiso][:vista], params[:permiso][:crear], params[:permiso][:modificar], params[:permiso][:eliminar])
    if grupo.update(data: data)
      flash[:success] = 'Se cambiaron los permisos correctamente'
    else
      flash[:error] = 'Error al cambiar los permisos'
    end
    redirect_to "/groups/#{grupo.descripcion_grupo}"
  end

  def parse_json(grupo, vista, crear, modificar, eliminar)
    data = JSON.parse grupo
    data[vista]['c'] = to_b(crear)
    data[vista]['m'] = to_b(modificar)
    data[vista]['d'] = to_b(eliminar)
    return data.to_json
  end

  private

  def to_b(number)
    number.eql? "1"
  end

end
