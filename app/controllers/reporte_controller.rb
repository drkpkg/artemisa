class ReporteController < ApplicationController

  #Hermes V1
  def dependencies
    data = [
        "animales":["genero", "especie", "raza" ,"cliente"],
        "personas":["tipo", "genero", "raza", "cliente"],
        "usuarios":["grupo", "persona", "permisos"],
        "ventas":["cliente", "producto", "empleado" ,"fecha"],
        "compras":["cliente", "producto", "empleado" ,"fecha"],
        "productos":["tipo", "marca", "lote", "vencimiento"]
    ]
    #breeds = .where(especie_id: params[:id]).select("id, nombre_raza")
    respond_to do |format|
      format.json { render :json => data }
    end
  end

end
