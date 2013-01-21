Paleoclan::Application.routes.draw do
  root  :to => 'pages#index'
  match '/menu'  => 'pages#menu'
  match '/rules' => 'pages#rules'

  resources :slots, :bets
  resource :today do
    get :roulette
  end

  namespace :admin do
    get '/' => 'settings#edit'
    resource  :settings, :only => [:edit, :update]
    resources :users,    :only => :index
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
