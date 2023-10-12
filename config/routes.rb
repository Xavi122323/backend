Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: :registrations,
    sessions: :sessions
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      root "clientes#index"
      # get "/clientes", to: "clientes#index"
      # get "/clientes/:id", to: "clientes#show"
      # post "/clientes", to: "clientes#create"
      # put "/clientes/:id", to: "clientes#update"
      # delete "/clientes/:id", to: "clientes#destroy"
      resources :clientes, only:[:index, :show, :create, :update, :destroy]
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        get "get_user", to: "sessions#inde"
      end
    end
  end
end
