class ClienteController < ApplicationController

  def list_all
    @clientes = Persona.joins(:persona_tipo).select("Persona.*, Persona_tipos.tipo").find_by(persona_tipo: 0)
  end
end
