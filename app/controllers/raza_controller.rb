class RazaController < ApplicationController

  def list_all
    razas = Raza.joins(:especie)
  end

  def create
    raza = Raza.new
    raza.nombre_raza = params[:nombre_raza]
    raza.especie_id = params[:especie]
    if raza.save
      flash[:success] = "Raza guardada satisfactoriamente"
      redirect_to animals_species_breeds_path
    else
      flash[:error] = "Error al crear raza"
      redirect_to animals_species_breeds_path
    end
  end

  def modify
    raza = Raza.find_by(id: params[:id])
    param_list = Hash.new
    param_list[:nombre_raza] = params[:nombre_raza]
    if raza.update(param_list)
      flash[:success] = "Raza modificada satisfactoriamente"
      redirect_to '/animals/species/breeds/'
    else
      flash[:error] = "Error al crear raza"
      redirect_to '/animals/species/breeds/'
    end
  end

  def delete
    raza = Raza.find_by(id: params[:id])
    if user.delete
      respond('200', 'En hora buena', 'Raza eliminada satisfactoriamente', 'success', '/animals/species/breeds/')
    else
      respond('400', 'Error', 'Sucedió un error al eliminar el usuario', 'error', '')
    end
  end

  def list_breeds
    breeds = Raza.where(especie_id: params[:id]).select("id, nombre_raza")
    respond_to do |format|
      format.json { render :json => breeds }
    end
  end

end
