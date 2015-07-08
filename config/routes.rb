Rails.application.routes.draw do
  devise_for :listings
  devise_for :users

root :to => "home#index"
end
