Rails.application.routes.draw do
  root 'categories#home'

  resources :categories do
    resources :tasks
  end
end
