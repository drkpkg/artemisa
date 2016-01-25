class HerramientaController < ApplicationController

  def info
    @info = Information.first
  end

  def edit
    @info = Information.first
  end

  def modify
    info = Information.first

    if info.blank?
      #nuevo
      info = Information.new(info_params)
      if info.save
        flash[:success] = 'Información de la empresa registrada'
      else
        flash[:error] = get_errors info
      end
    else
      if info.update(info_params)
        flash[:success] = 'Información de la empresa modificada'
      else
        flash[:error] = get_errors info
      end
    end
    redirect_to '/info'
  end

  private
  def info_params
    params.require(:info).permit(:name, :phone, :email, :address)
  end

end
