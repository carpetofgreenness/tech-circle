# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :requests
  root 'requests#index'
end
