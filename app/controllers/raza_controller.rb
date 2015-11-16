class RazaController < ApplicationController

  def list_all
    @razas = Raza.where(especie_id: params[:id])
  end

  def create
    raza = Raza.new
    raza.nombre_raza = params[:raza]
    raza.especie_id = params[:especie_id]

    if raza.valid?
      raza.save
      respond('200', 'En hora buena', 'Raza agregada satisfactoriamente', 'success', "/animals/species/breeds/#{params[:especie_id]}")
    else
      description = get_errors(raza)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    raza = Raza.find_by(id: params[:id])
    if raza.update(nombre_raza: params[:raza], especie_id: params[:especie_id])
      respond('200', 'En hora buena', 'lote modificado satisfactoriamente', 'success', "/animals/species/breeds/#{params[:especie_id]}")
    else
      description = get_errors(raza)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    raza = Raza.find_by(id: params[:id])
    if user.delete
      respond('200', 'En hora buena', 'Raza eliminada satisfactoriamente', 'success', "/animals/species/breeds/#{params[:especie_id]}")
    else
      respond('400', 'Error', 'Sucedió un error al eliminar el usuario', 'error', '')
    end
  end

  #Hermes V1
  def list_breeds
    breeds = Raza.where(especie_id: params[:id]).select("id, nombre_raza")
    #respond_to do |format|
    render :json => breeds
    #end
  end

end
