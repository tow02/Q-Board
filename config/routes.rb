Rails.application.routes.draw do
  resources :tags
  resources :answers

  resources :rooms do
    resources :questions, only:[:show, :new, :edit, :create, :update, :destroy]
  end
  devise_for :users

  root to: 'rooms#index'
end
