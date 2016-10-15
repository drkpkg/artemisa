class RefugioController < ApplicationController

  def donations
    @donaciones = Donacion.all
  end

  def donation_new
    @donacion = Donacion.new
  end

  def donation_create
    @donacion = Donacion.new(donation_params)
    if params[:donation][:anon] == '1'
      @donacion.nombre = "Anónimo"
    end
    if @donacion.save
      flash[:success] = 'Se registró nueva donación, YAY'
      redirect_to bunker_selection_donations_path
    else
      flash[:error] = get_errors @donacion
      redirect_to bunker_selection_donations_new_path
    end
  end

  def adoptions
    @adopciones = Adopcion.all
  end

  def adoption_new
    @adopcion = Adopcion.new
  end

  def adoption_create
    @adopcion = Adopcion.new(adoption_params)
    #animal = Animal.find_by(id: params[:adoption][:id])
    if @adopcion.save
      flash[:success] = 'Nueva adopción registrada, YAY'
      redirect_to "/bunker/selection/adoptions"
    else
      flash[:error] = get_errors @donation
      redirect_to "/bunker/selection/adoptions/new"
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:nombre, :tipo, :cantidad, :descripcion)
  end

  def adoption_params
    params.require(:adoption).permit(:animal_id, :nombre_persona, :identidad_persona)
  end
end
