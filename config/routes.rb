# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  namespace :gapps do
    resources :emails, only: %i[index]
  end
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
