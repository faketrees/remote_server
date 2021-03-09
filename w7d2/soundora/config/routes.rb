Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:show, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy] #there is only one session
end
