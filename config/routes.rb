Rails.application.routes.draw do

  get 'schedule/index'

  get 'home/index'
  
  get 'signin' => 'sessions#index'

  root 'sessions#index'
  
  get  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/facebook', :as => 'login'
  
  put 'shifts/:id/edit' => 'shifts#update'

  resources :employees
  
  resources :shifts
  #root :to => redirect('/employees')
  
  resources :requests
end