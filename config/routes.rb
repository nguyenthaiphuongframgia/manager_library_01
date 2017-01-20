Rails.application.routes.draw do
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  devise_for :users
  resources :users
  namespace :admin do
    root "static_pages#home"
    resources :categories, except: :show
    resources :books
    resources :users
    resources :requests
    resources :authors
    resources :publishers
    resources :charts
  end
end
