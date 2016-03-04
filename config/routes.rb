Rails.application.routes.draw do
  resources :comments
  resources :answers
  resources :question_tags
  resources :tags
  resources :questions
  resources :room_subjects
  resources :roles
  devise_for :users
end
