class BitacoraController < ApplicationController
  def list_all
    @histories = History.all
  end
end
