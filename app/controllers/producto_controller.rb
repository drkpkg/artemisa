class ProductoController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @products = Producto.all
    end
  end

  def new
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def create
    product = Product.new()
    product.product_name = params[:producto][:product_name]
    product.product_description = params[:producto][:product_description]
    product.product_type_id = params[:producto][:producto_tipo]
    product.product_price_buy = params[:producto][:product_price_buy]
    product.product_price_sell = params[:producto][:product_price_sell]

    if product.valid?
      product.save()
      redirect_to '/products/'
    else
      flash[:error] = get_errors(product)
      redirect_to '/products/new'
    end
  end

  def modify
    product = Producto.find_by(id: params[:id])
    param_hash = {:product_name => params[:name],
                  :product_description => params[:description],
                  :product_price_buy => params[:buy],
                  :product_price_sell => params[:sell],
                  :category_id => params[:category] }
    if product.update(param_hash)
      respond('200', 'En hora buena', 'Activo modificado satisfactoriamente', 'success', '/products/')
    else
      description = get_errors(product)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    product = Producto.find_by(id: params[:id])
    if (product.delete)
      respond('200', 'En hora buena', 'Activo eliminado satisfactoriamente', 'success', '/products/')
    else
      respond('400', 'Error', 'Error al eliminar activo, por favor intente de nuevo.', 'error', '')
    end
  end
end
