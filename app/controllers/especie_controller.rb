class EspecieController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @especies = Especie.all
    end
  end

  def create
    especie = Especie.new
    especie.nombre_especie = params[:especie]

    if especie.valid?
      especie.save
      respond('200', 'En hora buena', 'Lote agregado satisfactoriamente', 'success', '/animals/species')
    else
      description = get_errors(especie)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    especie = Especie.find_by(id: params[:id])
    if especie.update(nombre_especie: params[:especie])
      respond('200', 'En hora buena', 'lote modificado satisfactoriamente', 'success', '/animals/species/')
    else
      description = get_errors(especie)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    tipo = Especie.find_by(id: params[:id])
    if tipo.delete
      respond('200', 'En hora buena', 'Lote eliminado satisfactoriamente', 'success', '/animals/species')
    else
      respond('400', 'Error', 'Error al eliminar categor?a', 'error', '')
    end
  end
end
