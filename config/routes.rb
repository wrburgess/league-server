League::Application.routes.draw do
  require 'api_constraints'

  root :to => 'static#index'

  devise_for :users

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :players
    end

    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      resources :players
    end
  end

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
end
