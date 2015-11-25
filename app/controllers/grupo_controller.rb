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
    if !@grupo.data.nil?
      @permiso_object = JSON.parse @grupo.data
    else
      @permiso_object = JSON.parse load_permissions
    end
  end

  def create_permissions
    grupo = Grupo.new
    grupo.data = params[:data]

  end

  def modify_permissions
    grupo = Grupo.find_by(descripcion_grupo: params[:name])
    #parsing json
    if grupo.data.nil?
      data = parse_json(load_permissions, params[:permiso][:vista], params[:permiso][:crear], params[:permiso][:modificar], params[:permiso][:eliminar])
    else
      data = parse_json(grupo.data, params[:permiso][:vista], params[:permiso][:crear], params[:permiso][:modificar], params[:permiso][:eliminar])
    end

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

  def load_permissions
    return '{"animales":{"c":false,"m":false,"d":false},"especies":{"c":false,"m":false,"d":false},"razas":{"c":false,"m":false,"d":false},"clientes":{"c":false,"m":false,"d":false},"empleados":{"c":false,"m":false,"d":false},"usuarios":{"c":false,"m":false,"d":false},"grupos":{"c":false,"m":false,"d":false},"permisos":{"c":false,"m":false,"d":false},"horarios":{"c":false,"m":false,"d":false},"servicios":{"c":false,"m":false,"d":false},"productos":{"c":false,"m":false,"d":false},"tproductos":{"c":false,"m":false,"d":false},"lotes":{"c":false,"m":false,"d":false}}'
  end

end
