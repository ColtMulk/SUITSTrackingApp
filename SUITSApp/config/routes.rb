Rails.application.routes.draw do
  get 'member_category/index'
  get 'member_category/show'
  get 'member_category/new'
  get 'member_category/create'
  get 'member_category/edit'
  get 'member_category/update'
  get 'member_category/destroy'
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
