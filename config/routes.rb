Rails.application.routes.draw do
  root to: 'articles#index'

  devise_for :users

  resources :articles
  resources :sample_articles
end
