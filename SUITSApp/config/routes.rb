Rails.application.routes.draw do
  resources :event_types
  resources :member_categories
  resources :user_infos
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'dashboard/index'
  get 'home/index'
  devise_for :users, controllers: {registrations: 'users/registrations'}

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


  get 'attendances/user/:id', to: 'attendances#user', as: 'user_attendance'
  get 'events/new'
  get 'events/index'
  #get 'events/:id/attendances'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
