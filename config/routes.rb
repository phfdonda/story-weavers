Rails.application.routes.draw do
  root 'categories#index'

  get 'signup', to: 'users#new'
  post 'signup', to:'users#create'

  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %i[index show] do
    resources :votes
  end
  resources :categories do
    resources :articles, only: %i[index create] do
      resources :votes, only: %i[create destroy]
    end
  end
end
