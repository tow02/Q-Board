Rails.application.routes.draw do
  resources :tags
  resources :answers
  resources :questions
  resources :rooms
  devise_for :users

  root to: 'rooms#index'
end
