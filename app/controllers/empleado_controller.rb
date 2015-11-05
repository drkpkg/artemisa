class EmpleadoController < ApplicationController

  def list_all
    @empleados = Empleado.all
  end

  def create

  end

  def modify

  end

  def delete
    empleado = Empleado.find_by(id: params[:id])
    if empleado.destroy
      flash[:success] = "Se elimino correctamente"
      redirect_to employees_list_all_path
    else
      flash[:error] = "Se genero "
      redirect_to employees_list_all_path
    end
  end

end
