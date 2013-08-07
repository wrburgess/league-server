League::Application.routes.draw do

  root :to => "static#index"

  mount Resque::Server, :at => "/resque"

  devise_for :users

  namespace :users do
    get "alerts" => "users#alerts"
    get "settings" => "users#settings"
  end

  namespace :admin, defaults: { format: "html" } do
    root :to => "static#index"
    resources :groups
    resources :players
    resources :player_teams
    resources :player_conferences
    resources :rosters
    resources :users
  end

  resources :groups do
    get "draft" => "groups#draft"
    get "news" => "players#news"
    get "rules" => "groups#rules"
    get "schedule" => "groups#schedule"
    get "scores" => "groups#scores"
    get "search" => "players#search"
    get "standings" => "groups#standings"
    get "stats" => "players#stats"
    get "transactions" => "groups#transactions"

    namespace :settings do
      root :to => "groups#settings"
      get "scoring" => "groups#scoring"
    end

    resources :players

    resources :rosters do
      root :to => "rosters#index"
      get "moves" => "rosters#moves"
      get "trades" => "rosters#trades"

      namespace :settings do
        root :to => "rosters#settings"
      end
    end
  end

end
