class HerramientaController < ApplicationController

  def info
    @info = Information.first
  end

  def edit
    @info = Information.first
  end

  def modify
    @info = Information.first

    if @info.blank?
      #nuevo
      @info = Information.new(info_params)
      if @info.save
        flash[:success] = 'Información de la empresa registrada'
        redirect_to '/info'
      else
        flash[:error] = get_errors @info
        redirect_to '/info/edit'
      end
    else
      if @info.update(info_params)
        flash[:success] = 'Información de la empresa modificada'
        redirect_to '/info'
      else
        flash[:error] = get_errors @info
        redirect_to '/info/edit'
      end
    end
  end

  def activate_bunker
    @bunker = Information.first
    if @bunker.bunker == false
      @bunker.bunker = true
      description = 'Modo refugio activado'
      type = 'success'
    else
      @bunker.bunker = false
      description = 'Modo refugio desactivado'
      type = 'info'
    end

    @bunker.save

    render :json => {title: 'Refugio', description: description, type: type, redirect_page: '/info', status: '200' }
  end

  private
  def info_params
    params.require(:info).permit(:name, :phone, :email, :address, :logo)
  end

end
