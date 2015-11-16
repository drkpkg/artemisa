class BitacoraController < ApplicationController
  def list_all
    @histories = Bitacora.all
  end
end
