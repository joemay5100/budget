Rails.application.routes.draw do
  
  root 'welcome#home'
  
  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new', as: :login
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy', as: :logout
  
  get 'budget' => 'welcome#budget', as: :budget

  # resources :users

end
