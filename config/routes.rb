Rails.application.routes.draw do
  devise_for :users
  root 'tasks#home'

  resources :categories do
    resources :tasks
  end

  get "/home", to: "tasks#home"
  get "/urgent", to: "tasks#urgent"
  get "/overdue", to: "tasks#overdue"
end
