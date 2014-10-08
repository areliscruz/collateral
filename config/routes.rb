Rails.application.routes.draw do
  root 'collateral#index'

  resources :collateral, only: [:show, :new, :index]
  resources :flyers
end
