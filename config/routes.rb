Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :buys, only: [:index, :create]
  end

  root to: 'items#index'
  
end
