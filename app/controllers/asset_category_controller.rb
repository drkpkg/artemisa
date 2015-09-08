class AssetCategoryController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @categories = AssetCategory.all
      respond_to do |format|
        format.html
        format.csv {render text: @categories.to_csv}
        format.xls {render text: @categories.to_csv(col_sep: "\t")}
      end
    end
  end

  def create
    if params[:description] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Campo en blanco', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      category = AssetCategory.new
      category.asset_category_description = params[:description]
      if category.save
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Categoría agregada satisfactoriamente', type: 'success', redirect_page: 'list_all'}
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
      category = AssetCategory.find_by(id: params[:id])
      if category.update(asset_category_description: params[:newdescription])
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Categoría modificada satisfactoriamente', type: 'success', redirect_page: 'list_all'}
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
    category = AssetCategory.find_by(id: params[:id])
    if category.delete
      Asset.update_asset_category_index(params[:id])
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Categoría eliminada satisfactoriamente', type: 'success', redirect_page: 'list_all'}
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
