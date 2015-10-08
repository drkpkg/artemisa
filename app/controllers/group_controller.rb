class GroupController < ApplicationController
  def create
    group = Group.new
    group.group_name = params[:group_name]
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
    group = Group.find_by(id: params[:id])
    if (group.delete)
      User.update_group_index(params[:id])
      respond('200', 'En hora buena', 'grupo eliminado satisfactoriamente', 'success', '')
    else
      description = get_errors(group)
      respond('400', 'Error', description, 'error', '')
    end
  end
end
