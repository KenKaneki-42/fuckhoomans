Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  get "component", to: "pages#component"
  # get "contact", to: "pages#contact"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :user_actions, only: %i[index show update]
  resources :actions, only: %i[index show] do
    resources :user_actions, only: %i[create]
  end
end
