Rails.application.routes.draw do

  root 'groups#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :groups do
    resource :user_groups, only: [:create, :destroy]
    resources :lists, only: [:show, :create, :destroy, :edit, :update] do
      member do
        get :switch
      end
      resources :tasks, only: [:create, :destroy] do
        member do
          get :change
        end
      end
    end
  end
end
