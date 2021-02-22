Rails.application.routes.draw do
  resources :user_infos
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'dashboard/index'
  get 'home/index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
