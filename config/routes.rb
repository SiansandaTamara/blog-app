Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy]
  end

  resources :posts do
    resources :comments, only: %i[create new destroy]
    resources :likes, only: %i[create]
  end
end