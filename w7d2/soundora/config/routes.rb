Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  resources :bands do
    resources :albums, only: [:index]
    resources :tracks, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy]
end
