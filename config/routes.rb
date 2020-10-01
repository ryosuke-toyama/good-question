Rails.application.routes.draw do
  get 'problems/create'
  get 'problems/destroy'
  get 'rooms/index'
  get 'rooms/new'
  get 'rooms/create'
  get 'rooms/destroy'
  devise_for :users
  root to: "tasks#index"
  get 'tasks/:id', to: 'tasks#checked'
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :problem, only: [:create, :destroy]
  end
end
