Travel::Application.routes.draw do
  root :to => 'users#index'

  resources :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :locations
    end
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
