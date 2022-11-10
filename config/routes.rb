Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  get "about", to: "articles#about"

  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
