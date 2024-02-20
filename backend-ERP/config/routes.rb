Rails.application.routes.draw do
  

  resources :users do
    get 'new', action: :new
  end
  
  resources :profit_loss_statements
  # root 'profit_loss_statements#index'
  
  # post "/login", to: "users#login"
  # delete '/logout', to: 'users#logout'
end
