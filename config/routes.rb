League::Application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :users do
      get 'users' => 'users#index'
    end

    resources :teams do
      get 'teams' => 'teams#index'
    end
  end

  root :to => 'static#index'

end
