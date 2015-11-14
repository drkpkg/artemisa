class EmpleadoController < ApplicationController

  def list_all
    @empleados = Persona.find_by(persona_tipos_id: 1)
  end

  def create

  end

  def modify

  end

  def delete
    empleado = Persona.find_by(id: params[:id])
    if empleado.destroy
      flash[:success] = "Se elimino correctamente"
      redirect_to employees_list_all_path
    else
      flash[:error] = "Se generó un error al eliminar"
      redirect_to employees_list_all_path
    end
  end

end
