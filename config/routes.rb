Rails.application.routes.draw do
  resources :employees
  root :to => redirect('/employees')
end