Rails.application.routes.draw do
  root 'application#home'
  get 'about', to: 'application#about'
  resources :articles
end
