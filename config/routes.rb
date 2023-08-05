Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "tasks#index"

  get "tasks", to: "tasks#index", as: :tasks
  get "new", to: "tasks#new"
  get "task/:id", to: "tasks#show", as: :task
  get "task/:id/edit", to: "tasks#edit", as: :edit
  post "tasks", to: "tasks#create"
  patch "/task/:id", to: "tasks#update"
  delete "/task/:id", to: "tasks#destroy", as: :delete
end
