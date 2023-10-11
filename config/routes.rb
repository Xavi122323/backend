Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      root "users#create"
      # get "/clientes", to: "clientes#index"
      # get "/clientes/:id", to: "clientes#show"
      # post "/clientes", to: "clientes#create"
      # put "/clientes/:id", to: "clientes#update"
      # delete "/clientes/:id", to: "clientes#destroy"
      resources :clientes, only:[:index, :show, :create, :update, :destroy]
      resources :users, only:[:create]
    end
  end
end
