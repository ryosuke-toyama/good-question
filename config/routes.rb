Rails.application.routes.draw do
  get 'task/index'
  devise_for :users
end
