Rails.application.routes.draw do
  get "homes/index"
  devise_for :users, controllers: {
  # UserのSessionsControllerには、Users::SessionsControllerを利用する。他のコントローラーも同じように修正する。
  sessions:      "users/sessions",
  passwords:     "users/passwords",
  registrations: "users/registrations"
}
devise_for :admins, controllers: {
  # AdminのSessionsControllerには、Admins::SessionsControllerを利用する。他のコントローラーも同じように修正する。
  sessions:      "admins/sessions",
  passwords:     "admins/passwords",
  registrations: "admins/registrations"
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "homes#index"
end
