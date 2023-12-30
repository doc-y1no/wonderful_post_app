Rails.application.routes.draw do
  root to: 'articles#index'
  get '/mypage', to: 'mypage#show'
  devise_for :users

  resources :articles
  resources :users
end
