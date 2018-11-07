Rails.application.routes.draw do
  get 'home/index'

  get 'home/schedule'

  get 'home/employees'

  root 'home#index'

  resources :employees
  #root :to => redirect('/employees')
end