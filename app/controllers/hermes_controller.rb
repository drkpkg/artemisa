class HermesController < ApplicationController

  def version
    version = '0.1'
    render :json => version
  end

end
