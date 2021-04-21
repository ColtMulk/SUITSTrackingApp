Rails.application.routes.draw do
  resources :event_types
  resources :member_categories
  resources :user_infos
  get 'dashboard/index'
  get 'home/index'
  devise_for :users, controllers: {registrations: 'users/registrations'}

  # devise_scope :user do
  #   put 'admins/:id', to: 'user_infos#remove_admin', as: 'remove_admin'
  # end
    
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

  get 'admins', to: 'user_infos#admins', as: 'admins'
  get 'admins/remove/:id', to: 'user_infos#remove_admin', as: 'remove_admin'
  get 'admins/add', to: 'user_infos#add_admins', as: 'add_admins'
  get 'admins/promote/:id', to: 'user_infos#promote_to_admin', as: 'promote_to_admin'

  get 'events/select_event/:id', to: 'events#select_event', as: 'select_event'


  get 'attendances/user/:id', to: 'attendances#user', as: 'user_attendance'
  get 'user_infos/:id', to: 'user_infos#show', as: 'user_profile'
  # get 'events/new'
  # get 'events/index'
  #get 'events/:id/attendances'
  get 'help', to:'help#index'
  #get 'help/index', to:'help#index'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
