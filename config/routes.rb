Rails.application.routes.draw do

  root 'user#login'

  #General
  get 'admin' => 'user#admin'
  get 'dashboard' => 'user#dashboard'
  get 'logout' => 'user#logout'

  #users
  get 'user/auth_user' => 'user#auth_user' #Json
  get 'user/list_all' => 'user#list_all'
  post 'user/create' => 'user#create'
  post 'user/delete' => 'user#delete'
  post 'user/modify' => 'user#modify'

  #Assets
  get 'assets/list_all' => 'asset#list_all'
  get 'assets/new' => 'asset#new'
  get 'assets/:id/edit' => 'asset#edit'
  post 'assets/create' => 'asset#create'
  post 'assets/modify' => 'asset#modify'
  post 'assets/delete' => 'asset#delete'

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

end
