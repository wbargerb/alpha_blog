Rails.application.routes.draw do
  root 'application#home'
  get 'about', to: 'application#about'
end
