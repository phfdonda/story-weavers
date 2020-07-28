Rails.application.routes.draw do

  root 'articles#index'

  resources :users, only: %i[index show] do
    resources :votes
  end
  resources :categories do
    resources :articles, only: %i[index create] do
      resources :votes, only: %i[create destroy]
    end
  end
end
