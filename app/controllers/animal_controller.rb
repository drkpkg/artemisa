class AnimalController < ApplicationController

  def list_all
    @animales = Animal.all
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      flash[:success] = "Se registro correctamente"
      redirect_to '/animals/'
    else
      description = get_errors(animal)
      flash[:error] = description
      redirect_to '/animals/new'
    end
  end

  def modify
    animal = Animal.find_by(id: params[:animal][:id])
    if animal.update(animal_params)
      flash[:success] = "Modificado exitosamente"
      redirect_to "/animals/info/#{params[:animal][:id]}"
    else
      description = get_errors(animal)
      flash[:error] = description
      redirect_to "/animals/edit/#{params[:animal][:id]}"
    end
  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def info
    @animal = Animal.find_by(id: params[:id])
  end

  def delete
    animal = Animal.find_by(id: params[:id])
    if animal.delete
      flash[:success] = "Se elimino correctamente"
      respond('200', 'En hora buena', 'Usuario eliminado satisfactoriamente', 'success', '/clients')
    else
      flash[:error] = description
      respond('400', 'Error', 'Sucedi? un error al eliminar el usuario', 'error', '')
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:id, :image, :nombre, :alto, :largo, :peso, :fecha_deceso,:fecha_nacimiento, :genero_id, :raza_id, :cliente_id )
  end

end
