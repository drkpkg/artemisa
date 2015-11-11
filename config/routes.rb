Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'usuario#auth_user'

  #Animals
  get 'animals/' => 'animal#list_all'
  get 'animals/species' => 'especie#list_all'
  get 'animals/species/:specie' => 'raza#list_all'

  #users
  get 'users/' => 'usuario#list_all'
  post 'users/create' => 'usuario#create'
  post 'users/delete' => 'usuario#delete'
  post 'users/modify' => 'usuario#modify'

  #Products
  get 'products/' => 'producto#list_all'
  get 'products/new' => 'producto#new'
  get 'products/:id/edit' => 'producto#edit'
  post 'products/create' => 'producto#create'
  post 'products/modify' => 'producto#modify'
  post 'products/delete' => 'producto#delete'

  #Product Types
  get 'product_types/' => 'producto_tipo#list_all'
  post 'product_types/create' => 'producto_tipo#create'
  post 'product_types/delete' => 'producto_tipo#delete'
  post 'product_types/modify' => 'producto_tipo#modify'

  #Employee
  get 'employees/' => 'empleado#list_all'
  post 'employees/create' => 'empleado#create'
  post 'employees/delete' => 'empleado#delete'
  post 'employees/modify/' => 'empleado#modify'

  #History of users
  get '/logs' => 'bitacora#list_all'

  #groups
  post 'groups/create' => 'grupo#create'
  post 'groups/modify' => 'grupo#modify'
  post 'groups/delete' => 'grupo#delete'

  #Permissions per grupo
  get 'groups/:name' => 'permiso#list_all'

  #People General
  get 'people/new' => 'persona#new'
  post 'people/create' => 'persona#create'
  post 'people/modify' => 'persona#modify'
  post 'people/delete' => 'persona#delete'
  post 'people/create' => 'persona#create'

  get 'people/info/:username' => 'persona#info'
  get 'people/selection' => 'persona#selection'

  #Clients
  get 'clients/' => 'cliente#list_all'
  get 'clients/new' => 'cliente#new'
  get 'clients/info/:id' => 'cliente#info'
  post 'clients/create' => 'cliente#create'
  post 'clients/modify' => 'cliente#modify'
  post 'clients/delete' => 'cliente#delete'

  #Employees
  get 'employees/' => 'empleado#list_all'
  get 'employees/new' => 'empleado#new'
  get 'employees/info/:id' => 'empleado#info'
  post 'employees/create' => 'empleado#create'
  post 'employees/modify' => 'empleado#modify'
  post 'employees/create' => 'empleado#delete'

  #Stock
  get 'stock/' => 'stock#selection'

  #Schedule
  get 'schedules/' => 'horario#list_all'

  #Reports
  get 'reports/' => 'reporte#generator'

  #Services
  get 'services/' => 'servicio#list_all'

  #Artemisa API for mobile NOT IMPLEMENTED YET
  #scope 'hermes' do
  #  scope 'v1' do
  #    get 'version' => 'hermes#version'
  #  end
  #end
end
