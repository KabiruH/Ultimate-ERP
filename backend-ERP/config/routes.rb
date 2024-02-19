Rails.application.routes.draw do
  

  resources :users

  
  
  # post "/login", to: "users#login"
  # delete '/logout', to: 'users#logout'
end
