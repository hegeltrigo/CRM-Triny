Rails.application.routes.draw do

  resources :stages
  resources :deals
  resources :products
  resources :companies
  resources :people
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users do
    member do
      put 'admin_update'
      get 'admin_edit'
    end
    collection do
      get 'admin_new'
      post 'admin_create'
    end

  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
