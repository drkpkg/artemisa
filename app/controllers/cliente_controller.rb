class ClienteController < ApplicationController

  def list_all
    @clientes = Persona.where(persona_tipos_id: 1)
  end

  def create
    cliente = Persona.new(cliente_params)
    if cliente.save
      flash[:success] = "Se registro correctamente"
      redirect_to '/employees/'
    else
      description = get_errors(cliente)
      flash[:error] = description
      redirect_to '/employees/new'
    end
  end

  def modify
    cliente = Persona.find_by(id: params[:persona][:id])
    if cliente.update(cliente_params)
      flash[:success] = "Modificado exitosamente"
      redirect_to "/clients/info/#{params[:persona][:id]}"
    else
      description = get_errors(cliente)
      flash[:error] = description
      redirect_to "/clients/edit/#{params[:persona][:id]}"
    end
  end

  def edit
    @cliente = Persona.find_by(id: params[:id])
  end

  def info
    @cliente = Persona.find_by(id: params[:id])
  end

  def delete
    cliente = Persona.find_by(id: params[:id])
    if cliente.delete
      flash[:success] = "Se elimino correctamente"
      respond('200', 'En hora buena', 'Usuario eliminado satisfactoriamente', 'success', '/clients')
    else
      flash[:error] = description
      respond('400', 'Error', 'Sucedi? un error al eliminar el usuario', 'error', '')
    end
  end

  private

  def cliente_params
    params.require(:persona).permit(:id, :image, :nombre, :ap_paterno, :ap_materno, :identificacion, :fecha_nacimiento, :telefono, :correo, :direccion,:persona_tipos_id, :genero_id )
  end

end