class EmpleadoController < ApplicationController

  def list_all
    @empleados = Persona.where(persona_tipos_id: 1)
  end

  def create
    empleado = Persona.new(empleado_params)
    if empleado.save
      redirect_to '/employees/'
    else
      description = get_errors(empleado)
      flash[:error] = description
      redirect_to '/employees/new'
    end
  end

  def modify

  end

  def delete
    empleado = Persona.find_by(id: params[:id])
    if empleado.destroy
      flash[:success] = "Se elimino correctamente"
      redirect_to employees_list_all_path
    else
      description = get_errors(empleado)
      flash[:error] = description
      redirect_to employees_list_all_path
    end
  end

  def new

  end

  private

  def empleado_params
    params.require(:persona).permit(:image, :nombre, :ap_paterno, :ap_materno, :identificacion, :fecha_nacimiento, :telefono, :correo, :direccion,:persona_tipo_id, :genero_id )
  end

end
