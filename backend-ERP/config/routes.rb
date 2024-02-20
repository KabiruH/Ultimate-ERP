Rails.application.routes.draw do
  

  resources :users do
    get 'new', action: :new
  end
  
  resources :profit_loss_statements
  # root 'profit_loss_statements#index'
  
  # Login route (using a descriptive path and POST method)
  post '/api/v1/login', to: 'users#login'

  # Logout route (if applicable)
  delete '/api/v1/logout', to: 'users#logout'
end
