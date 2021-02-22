Rails.application.routes.draw do
  resources :user_infos
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'dashboard/index'
  get 'dashboard/rosterview'
  get 'home/index'

  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :events do
    member do
      get :delete
    end
  end

  get 'events/new'
  get 'events/index'
  #get 'events/:id/attendances'
  root 'home#index'

  # resources :dashboard
  # authenticated :user do
  #   root :to => "dashboard#index"
  # end
  # root :to => redirect("/home/index")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
