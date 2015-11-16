class EmpleadoController < ApplicationController

  def list_all
    @empleados = Persona.where.not(persona_tipos_id: 1)
  end

  def create
    empleado = Persona.new(empleado_params)
    if empleado.save
      flash[:success] = "Se registro correctamente"
      redirect_to '/employees/'
    else
      description = get_errors(empleado)
      flash[:error] = description
      redirect_to '/employees/new'
    end
  end

  def modify
    empleado = Persona.find_by(id: params[:persona][:id])
    if empleado.update(empleado_params)
      flash[:success] = "Modificado exitosamente"
      redirect_to "/employees/info/#{params[:persona][:id]}"
    else
      description = get_errors(empleado)
      flash[:error] = description
      redirect_to "/employees/edit/#{params[:persona][:id]}"
    end
  end

  def edit
    @empleado = Persona.find_by(id: params[:id])
  end

  def info
    @empleado = Persona.find_by(id: params[:id])
  end

  def delete
    empleado = Persona.find_by(id: params[:id])
    if empleado.delete
      flash[:success] = "Se elimino correctamente"
      respond('200', 'En hora buena', 'Usuario eliminado satisfactoriamente', 'success', '/employees')
    else
      flash[:error] = description
      respond('400', 'Error', 'Sucedi? un error al eliminar el usuario', 'error', '')
    end
  end

  private

  def empleado_params
    params.require(:persona).permit(:id, :image, :nombre, :ap_paterno, :ap_materno, :identificacion, :fecha_nacimiento, :telefono, :correo, :direccion,:persona_tipos_id, :genero_id )
  end

end
