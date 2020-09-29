Rails.application.routes.draw do
  resources :tasks,only: [:index, :new, :create, :edit, :update, :destoroy]
  devise_for :users
  root to: "tasks#index"
  get 'tasks/:id', to: 'tasks#checked'
end
