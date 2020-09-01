Rails.application.routes.draw do
  root 'categories#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'new_article', to: 'articles#new'
  post 'new_article', to: 'articles#create'

  get 'category/show/:id', to: 'articles#index'
  delete 'articles/:id/votes', to: 'votes#destroy'

  resources :users, only: %i[index show] do
    resources :votes
  end
  resources :categories do
    resources :articles, only: %i[index create]
  end
  resources :articles, only: %i[index create] do
    resources :votes, only: %i[create destroy]
  end

  Rails.application.routes.draw do
    mount Shrine.presign_endpoint(:cache) => '/presign'
  end
end
