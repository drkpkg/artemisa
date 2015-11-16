class LoteController < ApplicationController
  def list_all
    if !(cookies[:user_name] && cookies[:type])
      redirect_to root_path
    else
      @lotes = Lote.all
    end
  end

  def create
    lote = Lote.new
    lote.lote = params[:lote]
    lote.cantidad_lote = params[:cantidad]
    lote.cantidad_minima = params[:minimo]

    if lote.valid?
      lote.save
      respond('200', 'En hora buena', 'Lote agregado satisfactoriamente', 'success', '/batch/')
    else
      description = get_errors(lote)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    tipo = ProductoTipo.find_by(id: params[:id])
    if tipo.update(lote: params[:lote], cantidad_lote: params[:cantidad], cantidad_minima: params[:minimo])
      respond('200', 'En hora buena', 'lote modificado satisfactoriamente', 'success', '/batch/')
    else
      description = get_errors(tipo)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    tipo = Lote.find_by(id: params[:id])
    if tipo.delete
      respond('200', 'En hora buena', 'Lote eliminado satisfactoriamente', 'success', '/batch/')
    else
      respond('400', 'Error', 'Error al eliminar categor?a', 'error', '')
    end
  end
end
