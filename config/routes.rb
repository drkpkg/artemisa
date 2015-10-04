Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'user#auth_user'

  #users
  scope 'users' do
    get '/' => 'user#list_all'
    post 'create' => 'user#create'
    post 'delete' => 'user#delete'
    post 'modify' => 'user#modify'
  end

  #Assets
  scope 'products' do
    get '/' => 'product#list_all'
    get 'new' => 'product#new'
    get ':id/edit' => 'product#edit'
    post 'create' => 'product#create'
    post 'modify' => 'product#modify'
    post 'delete' => 'product#delete'
  end
  #Product Types
  scope 'product_types' do
    get '/' => 'product_type#list_all'
    post 'create' => 'product_type#create'
    post 'delete' => 'product_type#delete'
    post 'modify' => 'product_type#modify'
  end

  #Employee
  get 'employees/list_all' => 'employee#list_all'
  post 'employees/create' => 'employee#create'
  post 'employees/delete' => 'employee#delete'
  post 'employees/modify' => 'employee#modify'

  #History of users
  get '/logs' => 'history#list_all'

  #groups
  scope 'groups' do
    post 'create' => 'group#create'
    post 'modify' => 'group#modify'
    post 'delete' => 'group#delete'
  end
  #People
  scope 'people/' do
    post 'create' => 'person#create'
    post 'modify' => 'person#modify'
    post 'delete' => 'person#delete'
    get 'info/:username' => 'person#info'
    get 'selection' => 'person#selection'

    scope 'clients' do
      get 'list_all' => 'person#list_all'
      get 'new' => 'person#new'
    end
    scope 'employees' do
      get 'list_all' => 'person#list_all'
      get 'new' => 'person#new'
    end
  end
end
