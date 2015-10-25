Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'usuario#auth_user'

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
  get 'employees/list_all' => 'employee#list_all'
  post 'employees/create' => 'employee#create'
  post 'employees/delete' => 'employee#delete'
  post 'employees/modify' => 'employee#modify'

  #History of users
  get '/logs' => 'bitacora#list_all'

  #groups
  post 'groups/create' => 'grupo#create'
  post 'groups/modify' => 'grupo#modify'
  post 'groups/delete' => 'grupo#delete'

  #Permissions per grupo
  get 'groups/:name/permissions' => 'group_template#list_all'

  #People General
  post 'people/create' => 'persona#create'
  post 'people/modify' => 'persona#modify'
  post 'people/delete' => 'persona#delete'
  get 'people/info/:username' => 'persona#info'
  get 'people/selection' => 'persona#selection'

  #Clients
  get 'clients/list_all' => 'persona#list_all'
  get 'clients/new' => 'persona#new'
  get 'employees/list_all' => 'persona#list_all'
  get 'employees/new' => 'persona#new'

  #Artemisa API for mobile NOT IMPLEMENTED YET
  #scope 'hermes' do
  #  scope 'v1' do
  #    get 'version' => 'hermes#version'
  #  end
  #end
end
