Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'user#auth_user'

  #users
  get 'users/' => 'user#list_all'
  post 'users/create' => 'user#create'
  post 'users/delete' => 'user#delete'
  post 'users/modify' => 'user#modify'

  #Products
  get 'products/' => 'product#list_all'
  get 'products/new' => 'product#new'
  get 'products/:id/edit' => 'product#edit'
  post 'products/create' => 'product#create'
  post 'products/modify' => 'product#modify'
  post 'products/delete' => 'product#delete'

  #Product Types
  get 'product_types/' => 'product_type#list_all'
  post 'product_types/create' => 'product_type#create'
  post 'product_types/delete' => 'product_type#delete'
  post 'product_types/modify' => 'product_type#modify'

  #Employee
  get 'employees/list_all' => 'employee#list_all'
  post 'employees/create' => 'employee#create'
  post 'employees/delete' => 'employee#delete'
  post 'employees/modify' => 'employee#modify'

  #History of users
  get '/logs' => 'history#list_all'

  #groups
  post 'groups/create' => 'group#create'
  post 'groups/modify' => 'group#modify'
  post 'groups/delete' => 'group#delete'

  #Permissions per group
  get 'groups/:name/permissions' => 'group_template#list_all'

  #People General
  post 'people/create' => 'person#create'
  post 'people/modify' => 'person#modify'
  post 'people/delete' => 'person#delete'
  get 'people/info/:username' => 'person#info'
  get 'people/selection' => 'person#selection'

  #Clients
  get 'clients/list_all' => 'person#list_all'
  get 'clients/new' => 'person#new'
  get 'employees/list_all' => 'person#list_all'
  get 'employees/new' => 'person#new'

  #Artemisa API for mobile NOT IMPLEMENTED YET
  #scope 'hermes' do
  #  scope 'v1' do
  #    get 'version' => 'hermes#version'
  #  end
  #end
end
