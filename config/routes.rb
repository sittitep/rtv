Rails.application.routes.draw do
  resources :movies, only: [:index]
  resources :seasons, only: [:index]
  resources :contents, only: [:index]
  resources :purchases, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
