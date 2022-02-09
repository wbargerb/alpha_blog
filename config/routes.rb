Rails.application.routes.draw do
  root 'application#home'
  get 'about', to: 'application#about'
  resources :articles, only: [:show, :index]
end
