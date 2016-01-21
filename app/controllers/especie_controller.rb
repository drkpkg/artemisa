class EspecieController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @especies = Especie.all
    end
  end

  def create
    if @user_permissions["especies"]["c"]==false
      respond('200', 'Error', 'Permisos insuficientes', 'error', '')
    else
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
  end

  def modify
    if @user_permissions["especies"]["m"]==false
      respond('200', 'Error', 'Permisos insuficientes', 'error', '')
    else
      especie = Especie.find_by(id: params[:id])
      if especie.update(nombre_especie: params[:especie])
        respond('200', 'En hora buena', 'lote modificado satisfactoriamente', 'success', '/animals/species/')
      else
        description = get_errors(especie)
        respond('400', 'Error', description, 'error', '')
      end
    end
  end

  def delete
    if @user_permissions["especies"]["d"]==false
      respond('200', 'Error', 'Permisos insuficientes', 'error', '')
    else
      tipo = Especie.find_by(id: params[:id])
      if tipo.delete
        respond('200', 'En hora buena', 'Lote eliminado satisfactoriamente', 'success', '/animals/species')
      else
        respond('400', 'Error', 'Error al eliminar categoría', 'error', '')
      end
    end

  end
end
