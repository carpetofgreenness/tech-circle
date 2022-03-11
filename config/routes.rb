# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :requests, except: :show do
    patch :update_assignment
  end
  resources :people, except: :destroy
  resources :techies, only: :show
  root 'requests#index'
end
