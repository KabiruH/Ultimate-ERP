Rails.application.routes.draw do
  

  resources :users do
    get 'new', action: :new
  end
  
  
  # post "/login", to: "users#login"
  # delete '/logout', to: 'users#logout'
end
