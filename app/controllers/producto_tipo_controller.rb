class ProductoTipoController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @product_types = ProductoTipo.all
    end
  end

  def create
    category = ProductoTipo.new
    category.product_type_description = params[:description]
    if category.valid?
      category.save
      respond('200', 'En hora buena', 'Categoría agregada satisfactoriamente', 'success', '/product_types/')
    else
      description = get_errors(category)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    category = ProductoTipo.find_by(id: params[:id])
    if category.update(product_type_description: params[:newdescription])
      respond('200', 'En hora buena', 'Categoría modificada satisfactoriamente', 'success', '/product_types/')
    else
      description = get_errors(category)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    product_type = ProductoTipo.find_by(id: params[:id])
    if product_type.delete
      Producto.where(product_type_id: params[:id]).update_all(product_type_id: 0)
      respond('200', 'En hora buena', 'Categoría eliminada satisfactoriamente', 'success', '/product_types/')
    else
      respond('400', 'Error', 'Error al eliminar categoría', 'error', '')
    end
  end
end
