Rails.application.routes.draw do
  devise_for :users
  root 'categories#home'

  resources :categories do
    resources :tasks
  end
end
