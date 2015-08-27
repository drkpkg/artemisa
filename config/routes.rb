Rails.application.routes.draw do

  root 'user#login'
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

  #Department
  get 'departments/list_all' => 'department#list_all'
  post 'departments/create' => 'department#create'
  post 'departments/delete' => 'department#delete'
  post 'departments/modify' => 'department#modify'

  #Office
  get 'offices/list_all' => 'office#list_all'
  post 'offices/create' => 'office#create'
  post 'offices/delete' => 'office#delete'
  post 'offices/modify' => 'office#modify'

  #Currency
  get 'currencies/list_all' => 'currency#list_all'
  post 'currencies/create' => 'currency#create'
  post 'currencies/delete' => 'currency#delete'
  post 'currencies/modify' => 'currency#modify'

  #Exchange Rate
  get 'currency_exchanges/list_all' => 'currency_exchange#list_all'
  post 'currency_exchanges/create' => 'currency_exchange#create'
  post 'currency_exchange/delete' => 'currency_exchange#delete'
  post 'currency_exchanges/modify' => 'currency_exchange#modify'

  #Maintenance
  get 'maintenance/list_all' => 'maintenance#list_all'
  post 'maintenance/create' => 'maintenance#create'
  post 'maintenance/delete' => 'maintenance#delete'
  post 'maintenance/modify' => 'maintenance#modify'

end
