Rails.application.routes.draw do

  resources :users do 
    resources :goals, only: [:create]
  end

  resources :goals, only: [:destroy, :edit, :update]

  resource :session, only: [:new, :create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
