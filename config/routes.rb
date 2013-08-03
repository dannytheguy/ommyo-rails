OmmYo::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :omms, :only => [:show, :index, :new, :create]

  resources :brands, :only => [:show]

  devise_for :users, :skip => [:sessions]
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', :as => :new_user_session
    post 'sign_in' => 'devise/sessions#create', :as => :user_session
    match 'sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via
  end

  get 'users/current'
  resources :users, :only => [:show]

  root 'welcome#index'
end
