class OfficeController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @office = Office.all
      respond_to do |format|
        format.html
        format.csv {render text: @office.to_csv}
        format.xls {render text: @office.to_csv(col_sep: "\t")}
      end
    end
  end

  def create
    if params[:description] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      office = Office.new
      office.office_description = params[:description]
      if @office.save
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Cargo creado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Sucedió un error al crear el cargo', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def modify
    if params[:description] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      office = Office.find_by(id: params[:id])
      if office.update(office_description: params[:description])
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Cargo modificado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Sucedio un error al modificar el cargo', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def delete
    office = Office.find_by(id: params[:id])
    if office.destroy
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Cargo elimnado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Sucedió un error al eliminar el cargo', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end
end
