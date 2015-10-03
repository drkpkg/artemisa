Rails.application.routes.draw do

  root 'application#login'

  #General
  get 'dashboard' => 'application#dashboard'
  get 'logout' => 'application#logout'
  post 'auth_user' => 'user#auth_user'

  #users
  scope 'user' do
    get 'list_all' => 'user#list_all'
    post 'create' => 'user#create'
    post 'delete' => 'user#delete'
    post 'modify' => 'user#modify'
  end

  #Assets
  scope 'assets' do
    get 'list_all' => 'asset#list_all'
    get 'new' => 'asset#new'
    get ':id/edit' => 'asset#edit'
    post 'create' => 'asset#create'
    post 'modify' => 'asset#modify'
    post 'delete' => 'asset#delete'
  end
  #Assets Types
  get 'types/list_all' => 'asset_type#list_all'
  post 'types/create' => 'asset_type#create'
  post 'types/delete' => 'asset_type#delete'
  post 'types/modify' => 'asset_type#modify'

  #Assets Categories
  get 'categories/list_all' => 'asset_category#list_all'
  post 'categories/create' => 'asset_category#create'
  post 'categories/delete' => 'asset_category#delete'
  post 'categories/modify' => 'asset_category#modify'

  #Employee
  get 'employees/list_all' => 'employee#list_all'
  post 'employees/create' => 'employee#create'
  post 'employees/delete' => 'employee#delete'
  post 'employees/modify' => 'employee#modify'

  #History of users
  get 'histories/list_all' => 'history#list_all'

  #groups
  post 'groups/create' => 'group#create'
  post 'groups/modify' => 'group#modify'
  post 'groups/delete' => 'group#delete'

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
