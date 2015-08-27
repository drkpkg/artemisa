class DepartmentController < ApplicationController

  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @department = Department.all
      respond_to do |format|
        format.html
        format.csv {render text: @department.to_csv}
        format.xls {render text: @department.to_csv(col_sep: "\t")}
      end
    end
  end

  def create
    @department = Department.new
    @department.department_name = params[:name]
    @department.department_description = params[:description]
    if @department.save
      respond_to do |format|
        msg = { :status => "ok", msg: 'Departamento agregado satisfactoriamente', auth_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "Sucedio un error al agregar nuevo departamento."}
        format.json  { render :json => msg }
      end
    end
  end

  def modify
    department = Department.find_by(department_name: params[:oldname])
    if department.update(department_name: params[:newname], department_description: params[:description])
      respond_to do |format|
        msg = { :status => "ok", msg: 'Departamento modificado satisfactoriamente',auth_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "Sucedio un error al modificar departamento."}
        format.json  { render :json => msg }
      end
    end
  end

  def delete
    department = Department.find_by(id: params[:id])
    if department.destroy
      respond_to do |format|
        msg = { :status => "ok", msg: 'Departamento eliminado satisfactoriamente',auth_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "Sucedio un error al eliminar departamento."}
        format.json  { render :json => msg }
      end
    end
  end
end
