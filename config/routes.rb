# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: "accounts/omniauth_callbacks" }
  root to: "todos/tasks#index"

  namespace :todos do
    resources :tasks, only: %i[index create update show edit new]
  end

  get "/oauth2callback", to: "google_services_access#oauth2callback"
  get "/request_access", to: "google_services_access#request_access"

  resources :google_services, only: :index
  get "/flip", to: "google_services#flip"
end
