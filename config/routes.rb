require 'api_constraints'

League::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

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
      get 'users/:id' => 'users#show'
    end
  end

  scope :module => "browser" do
    root :to => 'static#index'
    get 'leagues' => 'groups#index'
    get 'leagues/:id' => 'groups#show'
  end

  if Rails.env.development?
    mount GroupMailer::Preview => 'mail_view_group'
    mount RosterMailer::Preview => 'mail_view_roster'
  end
end
