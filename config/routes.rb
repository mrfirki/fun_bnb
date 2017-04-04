Rails.application.routes.draw do

  root 'welcome#index'

  #*** rails g clearance:routes show all these default Clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:index, :show, :edit, :update, :create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings, only: [:index]
  end

  resources :searches

  resources :listings do
    resources :reservations, only: [:index, :new, :create]
  end

  resources :users do
    resources :reservations, only: [:index, :destroy, :show]
  end

  resources :reservations do
    resources :payments, only: [:new, :create]
    # get 'payments/new'
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  #*** end of default routes of Clearance

  get "/auth/:provider/callback" => "sessions#create_from_omniauth", as: "fb"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
