Rails.application.routes.draw do
  resources :tags
  # resources :answers

  resources :rooms do
    resources :questions, only: [:show, :new, :edit, :create, :update, :destroy]
  end

  resources :answers do
    member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end

  devise_for :users

  resources :users, only: [:show]

  root to: 'rooms#index'
end
