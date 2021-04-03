Rails.application.routes.draw do
  devise_for :users
  resources :nitrogens
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'nitrogens#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
