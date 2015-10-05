class ProductController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @products = Product.all
    end
  end

  def new
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def create
    if params[:product][:product_name]!='' || params[:product][:product_price_buy]!='' || params[:product][:product_price_sell]!=''
      product = Product.new()
      product.product_name = params[:product][:product_name]
      product.product_description = params[:product][:product_description]
      product.product_type_id = params[:product][:product_type]
      product.product_price_buy = params[:product][:product_price_buy]
      product.product_price_sell = params[:product][:product_price_sell]

      if product.save()
        redirect_to '/products/'
      else
        redirect_to '/products/new'
      end
    else
      redirect_to '/products/new'
    end
  end

  def modify
    product = Product.find_by(id: params[:id])
    if(params[:id] == '' || params[:name] == '' || params[:description] == '' || params[:buy] == '' || params[:sell] == '')
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      param_hash = {:product_name => params[:name],
                    :product_description => params[:description],
                    :product_price_buy => params[:buy],
                    :product_price_sell => params[:sell],
                    :category_id => params[:category] }
      if product.update(param_hash)
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Activo modificado satisfactoriamente', type: 'success', redirect_page: '/products/'}
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
    product = Product.find_by(id: params[:id])
    if (product.delete)
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Activo eliminado satisfactoriamente', type: 'success', redirect_page: '/products/'}
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
