Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks, only: %i[index new create edit update destroy]
  resources :rooms, only: %i[index new create destroy] do
    resources :problem, only: %i[create destroy]
  end
  get 'tasks/:id', to: 'tasks#checked'
end
