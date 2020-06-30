Rails.application.routes.draw do
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/edit'
  root 'groups#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :groups do
    resource :user_groups, only: [:create, :destroy]
    resources :lists, only: [:show, :create, :destroy]
  end
end
