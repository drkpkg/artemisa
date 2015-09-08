class GroupController < ApplicationController
  def create
    if params[:group_name] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      group = Group.new
      group.group_name = params[:group_name]
      if group.save()
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Grupo creado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Error al crear grupo, por favor intente de nuevo.', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def modify
    group = Group.find_by(id: params[:id])
    if params[:group_name] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      param_hash = {group_name: params[:group_name]}
      if group.update(param_hash)
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Grupo modificado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Error al modificar grupo, por favor intente de nuevo.', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def delete
    group = Group.find_by(id: params[:id])
    if (group.delete)
      User.update_group_index(params[:id])
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'grupo eliminado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Error al eliminar grupo, por favor intente de nuevo.', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end
end
