Rails.application.routes.draw do
  resources :tags
  resources :answers

  resources :rooms do
    resources :questions
  end
  devise_for :users

  root to: 'rooms#index'
end
