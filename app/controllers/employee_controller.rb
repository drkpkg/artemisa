class EmployeeController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @employee = Employee.all
      respond_to do |format|
        format.html
        format.csv {render text: @employee.to_csv}
        format.xls {render text: @employee.to_csv(col_sep: "\t")}
      end
    end
  end

  def create
    employee = Employee.new
    employee.employee_name = params[:name]
    employee.employee_identity = params[:identity]
    employee.employee_direction = params[:direction]
    employee.office_id = params[:office]
    employee.department_id = params[:department]
    if employee.save
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Empleado registrado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Error al registrar empleado', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end

  def modify
    if params[:identity] == '' || params[:name] == '' || params[:direction] == ''
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Por favor rellene los campos los campos vacíos', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    else
      values = {employee_identity: params[:identity], employee_name: params[:name], employee_direction: params[:direction]}
      values[:office_id] = params[:office] if params[:office] != 'null'
      values[:department_id] = params[:department] if params[:department] != 'null'
      employee = Employee.find_by(id: params[:id])
      if employee.update(values)
        respond_to do |format|
          msg = { :status => "200", title: 'En hora buena', description: 'Empleado modificado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
          format.json  { render :json => msg }
        end
      else
        respond_to do |format|
          msg = { :status => "400", title: 'Error', description: 'Se produjo un error al tratar de modificar empleado', type: 'error', redirect_page: ''}
          format.json  { render :json => msg }
        end
      end
    end
  end

  def delete
    employee = Employee.find_by(id: params[:id])
    if employee.delete
      respond_to do |format|
        msg = { :status => "200", title: 'En hora buena', description: 'Empleado eliminado satisfactoriamente', type: 'success', redirect_page: 'list_all'}
        format.json  { render :json => msg }
      end
    else
      respond_to do |format|
        msg = { :status => "400", title: 'Error', description: 'Se produjo un error al tratar de modificar empleado', type: 'error', redirect_page: ''}
        format.json  { render :json => msg }
      end
    end
  end
end
