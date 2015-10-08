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
    product = Product.new()
    product.product_name = params[:product][:product_name]
    product.product_description = params[:product][:product_description]
    product.product_type_id = params[:product][:product_type]
    product.product_price_buy = params[:product][:product_price_buy]
    product.product_price_sell = params[:product][:product_price_sell]

    if product.valid?
      product.save()
      redirect_to '/products/', flash: get_errors(product)
    else
      redirect_to '/products/new'
    end
  end

  def modify
    product = Product.find_by(id: params[:id])
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
    product = Product.find_by(id: params[:id])
    if (product.delete)
      respond('200', 'En hora buena', 'Activo eliminado satisfactoriamente', 'success', '/products/')
    else
      respond('400', 'Error', 'Error al eliminar activo, por favor intente de nuevo.', 'error', '')
    end
  end
end
