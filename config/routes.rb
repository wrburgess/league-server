League::Application.routes.draw do

  devise_for :users

  get 'users' => 'users#index'

  root :to => 'static#index'

end
