League::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

  devise_for :users

  namespace :admin do
    root :to => 'static#index'

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

  scope :module => "browser", defaults: { format: 'html' } do
    root :to => 'static#index'
    get 'leagues' => 'groups#index'
    get 'league/:group_id' => 'groups#show'
    get 'league/:group_id/draft' => 'groups#draft'
    get 'league/:group_id/standings' => 'groups#standings'
    get 'league/:group_id/transactions' => 'groups#transactions'
    get 'league/:group_id/scoreboard' => 'games#scoreboard'
    get 'league/:group_id/schedule' => 'games#schedule'
    get 'league/:group_id/team' => 'rosters#show'
    get 'league/:group_id/team/:team_id' => 'rosters#show'
  end

  if Rails.env.development?
    mount GroupMailer::Preview => 'mail_view_group'
    mount RosterMailer::Preview => 'mail_view_roster'
  end
end
