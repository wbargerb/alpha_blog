Rails.application.routes.draw do
  root 'articles#home'
  get 'about', to: 'application#about'
  resources :articles
end
