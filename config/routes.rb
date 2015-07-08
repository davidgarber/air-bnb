Rails.application.routes.draw do
  devise_for :listings
  devise_for :users

  resources :users
  resources :listings

root :to => "home#index"
end
