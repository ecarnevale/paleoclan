Paleoclan::Application.routes.draw do
  root  :to => 'pages#index'
  match '/rules' => 'pages#rules'

  resources :slots
  resource :today do
    get :roulette
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
