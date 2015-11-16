class ProductoTipoController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @tipos = ProductoTipo.all
    end
  end

  def create
    tipo = ProductoTipo.new
    tipo.nombre_tipo_producto = params[:nombre]
    if tipo.valid?
      tipo.save
      respond('200', 'En hora buena', 'Categoría agregada satisfactoriamente', 'success', '/product_types/')
    else
      description = get_errors(tipo)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    tipo = ProductoTipo.find_by(id: params[:id])
    if tipo.update(nombre_tipo_producto: params[:nombre])
      respond('200', 'En hora buena', 'Categoría modificada satisfactoriamente', 'success', '/product_types/')
    else
      description = get_errors(tipo)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    tipo = ProductoTipo.find_by(id: params[:id])
    if tipo.delete
      Producto.where(product_type_id: params[:id]).update_all(product_type_id: 0)
      respond('200', 'En hora buena', 'Categoría eliminada satisfactoriamente', 'success', '/product_types/')
    else
      respond('400', 'Error', 'Error al eliminar categoría', 'error', '')
    end
  end
end
