class ProductTypeController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @product_types = ProductType.all
    end
  end

  def create
    if params[:description] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Campo en blanco', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      category = ProductType.new
      category.product_type_description = params[:description]
      if category.save
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Categoría agregada satisfactoriamente', type: 'success', redirect_page: '/product_types/'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Error al crear categoría', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def modify
    if params[:newdescription] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Campo en blanco', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      category = ProductType.find_by(id: params[:id])
      if category.update(product_type_description: params[:newdescription])
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Categoría modificada satisfactoriamente', type: 'success', redirect_page: '/product_types/'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Error al modificar categoría', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def delete
    product_type = ProductType.find_by(id: params[:id])
    if product_type.delete
      Product.where(category_id: params[:id]).update_all(category_id: 0)
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Categoría eliminada satisfactoriamente', type: 'success', redirect_page: '/product_types/'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Error al eliminar categoría', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end
end
