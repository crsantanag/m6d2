Rails.application.routes.draw do
  resources :comments

  resources :posts, except: [ :index ] do
    resources :comments, only: [ :create, :destroy ] # Anida los comentarios dentro de los posts
  end

  # Defines the root path route ("/")
  root "posts#index"
  get "/posts", to: "posts#index", as: "user_root" # Lo envío a posts despues de login (user_root es la root del usuario)

  # get "pages/index" Comento la ruta, ya no la usaré

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
    }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
