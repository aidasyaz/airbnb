Rails.application.routes.draw do
  get 'braintree/new'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # index route
  get 'welcome/index'
  root 'welcome#index'

 
 
 post 'payments/checkout'

 resources :users
 
 resources :listings do
    resources :reservations, only: [:new, :show, :create,:destroy] do
      resources :payments, only: [:new, :create, :show]
    end
 end

# clearance routing
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # login with google
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
