OmmYo::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :omms, :only => [:show, :index, :new, :create]

  resources :brands, :only => [:show]

  devise_for :users, :skip => [:sessions, :registrations]
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', :as => :new_user_session
    post 'sign_in' => 'devise/sessions#create', :as => :user_session
    match 'sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via

    get 'users/cancel' => 'devise/registrations#cancel', :as => :cancel_user_registration
    post 'sign_up' => 'devise/registrations#create', :as => :user_registration
    get 'sign_up' => 'devise/registrations#new', :as => :new_user_registration
    get 'users/edit' => 'devise/registrations#edit', :as => :edit_user_registration
    patch 'users' => 'devise/registrations#update', :as => nil
    put 'users' => 'devise/registrations#update', :as => nil
    delete 'users' => 'devise/registrations#destroy', :as => nil
  end

  get 'users/current'
  resources :users, :only => [:show]
end
