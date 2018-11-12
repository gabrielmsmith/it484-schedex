Rails.application.routes.draw do
  get 'home/index'

  get 'home/index'

  get 'schedule/index'

  get 'home/index'

  get 'home/schedule'

  get 'home/employees'
  
  get 'signin' => 'sessions#index'

  root 'sessions#index'
  
  get  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/facebook', :as => 'login'

  resources :employees
  #root :to => redirect('/employees')
end