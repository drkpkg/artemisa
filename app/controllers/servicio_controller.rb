class ServicioController < ApplicationController

  def list_all
    @servicios = Servicio.all
  end

  def new
    @servicio = Servicio.new
  end

  def edit
    @servicio = Servicio.find_by(id: params[:id])
  end

  def create
    @servicio = Servicio.new(servicio_params)
    if @servicio.save
      redirect_to services_path
    else
      flash[:error] = get_errors @servicio
      redirect_to services_new_path
    end
  end

  def update
    @servicio = Servicio.find_by(id: params[:id])
    if @servicio.update(servicio_params)
      flash[:success] = "Actualizado correctamente"
      redirect_to services_path
    else
      flash[:error] = get_errors @servicio
      redirect_to services_new_path
    end
  end

  def delete

  end

  private

  def servicio_params
    params.require(:servicio).permit(:servicio, :nombre_servicio, :descripcion_servicio, :precio)
  end
end
