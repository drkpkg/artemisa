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
      @asset.asset_price_buy = params[:asset][:asset_price_buy]
      @asset.asset_price_sell = params[:asset][:asset_price_sell]

      if @asset.save()
        redirect_to '/assets/list_all'
      else
        redirect_to '/assets/new'
      end
    else
      redirect_to '/assets/new'
    end
  end

  def modify
    asset = Asset.find_by(id: params[:id])
    if(params[:id] == '' || params[:name] == '' || params[:description] == '' || params[:buy] == '' || params[:sell] == '')
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      param_hash = {:asset_name => params[:name],
                    :asset_description => params[:description],
                    :asset_price_buy => params[:buy],
                    :asset_price_sell => params[:sell] }
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
