Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks, only: %i[index new create edit update destroy]
  resources :rooms, only: %i[new create destroy] do
    resources :problems, only: %i[index create destroy]
  end
  get 'tasks/:id', to: 'tasks#checked'
end
