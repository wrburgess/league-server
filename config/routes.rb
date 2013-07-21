League::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

  devise_for :users 

  namespace :users do
    get "alerts" => "users#alerts"
    get "settings" => "users#settings"
  end

  namespace :admin, defaults: { format: "html" } do
    root :to => "static#index"
    resources :players
    resources :teams
    resources :users
  end

  root :to => "static#index"

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

  if Rails.env.development?
    mount GroupMailer::Preview => "mail_view_group"
    mount RosterMailer::Preview => "mail_view_roster"
  end
end
