Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'usuario#auth_user'

  #Tools
  get 'tools' => 'herramienta#list_all'

  #Information system
  get 'info' => 'herramienta#info'
  get 'info/edit' => 'herramienta#edit'
  post 'info/modify' => 'herramienta#modify'


  #Animals
  get 'animals/' => 'animal#list_all'
  get 'animals/new' => 'animal#new'
  get 'animals/edit/:id' => 'animal#edit'
  get 'animals/info/:id' => 'animal#info'
  post 'animals/create' => 'animal#create'
  patch 'animals/modify' => 'animal#modify'
  post 'animals/delete' => 'animal#delete'

  get 'animals/species/' => 'especie#list_all'
  post 'animals/species/create' => 'especie#create'
  post 'animals/species/modify' => 'especie#modify'
  post 'animals/species/delete' => 'especie#delete'

  get 'animals/species/breeds/' => 'raza#list_all'
  get 'animals/species/breeds/:id' => 'raza#list_all'
  post 'animals/species/breeds/create' => 'raza#create'
  post 'animals/species/breeds/modify' => 'raza#modify'
  post 'animals/species/breeds/delete' => 'raza#delete'

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

  #Batch
  get 'batch/' => 'lote#list_all'
  post 'batch/create' => 'lote#create'
  post 'batch/delete' => 'lote#delete'
  post 'batch/modify' => 'lote#modify'

  #History of users
  get '/logs' => 'bitacora#list_all'

  #groups
  post 'groups/create' => 'grupo#create'
  post 'groups/modify' => 'grupo#modify'
  post 'groups/delete' => 'grupo#delete'
  get 'groups/:name' => 'grupo#permissions'
  post 'groups/permissions/:name/modify' => 'grupo#modify_permissions'


  #Clients
  get 'clients/' => 'cliente#list_all'
  get 'clients/new' => 'cliente#new'
  get 'clients/info/:id' => 'cliente#info'
  get 'clients/edit/:id' => 'cliente#edit'
  patch 'clients/modify' => 'cliente#modify'
  post 'clients/create' => 'cliente#create'
  post 'clients/modify' => 'cliente#modify'
  post 'clients/delete' => 'cliente#delete'

  #Employees
  get 'employees/' => 'empleado#list_all'
  get 'employees/new' => 'empleado#new'
  get 'employees/info/:id' => 'empleado#info'
  get 'employees/edit/:id' => 'empleado#edit'
  patch 'employees/modify' => 'empleado#modify'
  post 'employees/create' => 'empleado#create'
  post 'employees/delete' => 'empleado#delete'

  #Stock
  get 'stock/' => 'stock#selection'
  get 'people/selection' => 'persona#selection'
  get 'animals/selection' => 'animal#selection'

  #Schedule
  get 'schedules/' => 'horario#list_all'
  post 'schedules/create' => 'horario#create'
  post 'schedules/modify' => 'horario#modify'
  post 'schedules/delete' => 'horario#delete'

  #Reports
  get 'reports/' => 'reporte#generator'

  #Services
  get 'services/' => 'servicio#list_all'

  #Artemisa API for mobile NOT IMPLEMENTED YET
  scope 'hermes' do
    scope 'v1' do
      get 'version' => 'hermes#version'
      scope 'breeds' do
        get 'list' => 'raza#list_breeds'
      end
      scope 'animals' do
        post 'create' => 'animal#create_animal'
      end
      scope 'clients' do
        get 'list' => 'cliente#list_clients'
      end
      scope 'reports' do
        get 'tables' => 'reporte#tables'
        get 'dependencies/:name' => 'reporte#dependencies'
      end
    end
  end
end
