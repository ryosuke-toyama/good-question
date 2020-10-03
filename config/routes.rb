Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :problem, only: [:create, :destroy]
  end
  get 'tasks/:id', to: 'tasks#checked'
end
