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
    if @user_permissions["animales"]["d"]==false
      respond('200', 'Error', 'Permisos insuficientes', 'error', '')
    else
      animal = Animal.find_by(id: params[:id])
      if animal.delete
        flash[:success] = "Se elimino correctamente"
        respond('200', 'En hora buena', 'Usuario eliminado satisfactoriamente', 'success', '/animals')
      else
        flash[:error] = description
        respond('400', 'Error', 'Sucedi? un error al eliminar el usuario', 'error', '')
      end
    end
  end

  def edit
    if @user_permissions["animales"]["m"]==false
      flash[:error] = "Permisos insuficiente"
      redirect_to animals_path
    end
  end

  def new
    if @user_permissions["animales"]["c"]==false
      flash[:error] = "Permisos insuficiente"
      redirect_to animals_path
    end
  end

  #Hermes API
  #PARAMS
  # :id, :image, :nombre, :alto, :largo, :peso, :fecha_deceso,:fecha_nacimiento, :genero_id, :raza_id, :cliente_id
  def create_animal
    animal = Animal.new(animal_params)
    if animal.save
      #respond_to do |format|
        msg = {status: 200, description: 'Registro completo'}
        render :json => msg
      #end
    else
      #respond_to do |format|
        msg = {status: 400, description: 'Error al registrar'}
        render :json => msg
      #end
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:id, :image, :nombre, :alto, :largo, :peso, :fecha_deceso,:fecha_nacimiento, :genero_id, :raza_id, :cliente_id )
  end

end
