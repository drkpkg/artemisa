class HorarioController < ApplicationController
  def list_all
    @horarios = Horario.all
  end

  def create
    horario = Horario.new
    horario.horario_entrada = params[:hora_entrada]
    horario.horario_salida = params[:hora_salida]
    if horario.valid?
      horario.save()
      respond('200', 'En hora buena', 'Grupo creado satisfactoriamente', 'success', '/schedules/')
    else
      description = get_errors(horario)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def modify
    horario = Horario.find_by(id: params[:id])
    param_hash = {horario_entrada: params[:hora_entrada], horario_salida: params[:hora_salida]}
    if horario.update(param_hash)
      respond('200', 'En hora buena', 'Grupo modificado satisfactoriamente', 'success', '/schedules/')
    else
      description = get_errors(horario)
      respond('400', 'Error', description, 'error', '')
    end
  end

  def delete
    horario = Horario.find_by(id: params[:id])
    if (horario.delete)
      respond('200', 'En hora buena', 'grupo eliminado satisfactoriamente', 'success', '/schedules/')
    else
      description = get_errors(horario)
      respond('400', 'Error', description, 'error', '')
    end
  end
end
