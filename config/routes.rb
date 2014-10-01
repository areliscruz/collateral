Rails.application.routes.draw do
  root 'collateral#index'

  resources :collateral, only: [:show, :index]
  resources :flyers, only: [:create, :new, :show]
end
