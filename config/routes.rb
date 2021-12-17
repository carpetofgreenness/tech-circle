# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :requests, except: :show
  resources :people, except: :destroy
  root 'requests#index'
end
