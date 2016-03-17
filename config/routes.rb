Rails.application.routes.draw do
  
  root 'welcome#home'
  
  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create', as: :create_user
  get 'login' => 'sessions#new', as: :login
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout
  
  get 'budget' => 'welcome#budget', as: :budget
  get 'users' => 'budgets#list_users', as: :users
  get 'newuser' => 'budgets#new_user', as: :new_user
  post 'newuser' => 'budgets#add_user', as: :add_user

  # resources :users

end
