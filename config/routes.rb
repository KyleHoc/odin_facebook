Rails.application.routes.draw do
  get 'friendships/index'
  get 'friendships/destroy'
  resources :friend_requests do
    member do
      post :accept
      post :reject
    end
  end
  devise_for :users
  resources :users
  resources :posts do
    resources :likes
  end
  resources :comments

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
