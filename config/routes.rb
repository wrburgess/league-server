League::Application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :players do
      get 'players' => 'players#index'
      get 'players/:id' => 'players#show'
    end

    resources :teams do
      get 'teams' => 'teams#index'
    end

    resources :users do
      get 'users' => 'users#index'
    end
  end

  root :to => 'static#index'

end
