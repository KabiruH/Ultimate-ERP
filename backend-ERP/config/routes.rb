Rails.application.routes.draw do
  
  resources :customers
  
  post "/login", to: "customers#login"
  delete '/logout', to: 'customers#logout'
end
