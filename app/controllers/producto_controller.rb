class ProductoController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @productos = Producto.all
    end
  end

  def new
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    end
  end

  def create
    product = Producto.new(producto_params)

    if product.save()
      redirect_to '/products/'
    else
      flash[:error] = get_errors(product)
      redirect_to '/products/new'
    end
  end

  def modify
    product = Producto.find_by(id: params[:id])
    param_hash = {:marca_producto => params[:marca],
                  :nombre_producto => params[:producto],
                  :precio_total => params[:precio],
                  :fecha_vencimiento => params[:vencimiento],
                  :producto_tipo_id => params[:tipo],
                  :lotes_id => params[:lote]}
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

  private

  def producto_params
    params.require(:producto).permit(:id, :marca_producto, :nombre_producto, :precio_total, :fecha_vencimiento, :producto_tipo_id, :lotes_id )
  end
end
