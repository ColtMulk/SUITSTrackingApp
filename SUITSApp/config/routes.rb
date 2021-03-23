Rails.application.routes.draw do
  resources :event_types
  resources :member_categories
  resources :user_infos
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
      post :create
    end
  end


  resources :user_infos do
    member do
      get :delete
    end
  end

  get 'user_infos/select_user/:id', to: 'user_infos#select_user', as: 'select_user'
  get 'events/select_event/:id', to: 'events#select_event', as: 'select_event'


  get 'attendances/user/:id', to: 'attendances#user', as: 'user_attendance'
  get 'user_infos/:id', to: 'user_infos#show', as: 'user_profile'
  get 'events/new'
  get 'events/index'
  #get 'events/:id/attendances'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
