Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'dashboard/index'
  get 'home/index'
  devise_for :users

  resources :events do
    member do
      get :delete
    end
  end

  resources :attendances do
    member do
      get :delete
    end
  end

  get 'events/new'
  get 'events/index'
  #get 'events/:id/attendances'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
