Rails.application.routes.draw do
  get 'schedule/index'

  get 'home/index'

  get 'home/schedule'

  get 'home/employees'

  root 'home#index'

  resources :employees
  #root :to => redirect('/employees')
end