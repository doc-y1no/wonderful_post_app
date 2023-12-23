Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles
  resources :sample_articles
end
