class AssetController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @asset = Asset.all
      respond_to do |format|
        format.html
        format.csv {render text: @asset.to_csv}
        format.xls {render text: @asset.to_csv(col_sep: "\t")}
      end
    end
  end

  def new
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def create
    if params[:asset][:asset_name]!='' || params[:asset][:asset_category] || params[:asset][:activo_precio_compra]
      @asset = Asset.new()
      @asset.asset_name = params[:asset][:asset_name]
      @asset.asset_description = params[:asset][:asset_description]
      @asset.category_id = params[:asset][:asset_category]
      @asset.asset_price_buy = params[:asset][:activo_precio_compra]

      if @asset.save()
        redirect_to assets_list_all_path
      else
        redirect_to assets_new_path
      end
    else

      redirect_to assets_new_path
    end
  end

  def modify
    asset = Asset.find_by(id: params[:id])
    if(params[:id] == '' || params[:name] == '' || params[:description] == '')
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      if(params[:employee_id]=='null')
        param_hash = {:asset_name => params[:name], :asset_description => params[:description]}
      else
        param_hash = {:asset_name => params[:name], :asset_description => params[:description], :employee_id => params[:employee_id]}
      end

      if asset.update(param_hash)
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Activo modificado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Error al modificar activo, por favor intente de nuevo.', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def delete
    asset = Asset.find_by(id: params[:id])
    if (asset.delete)
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Activo eliminado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Error al eliminar activo, por favor intente de nuevo.', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end
end
