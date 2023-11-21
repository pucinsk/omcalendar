# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: "accounts/omniauth_callbacks" }
  root to: "todos/tasks#index"

  namespace :todos do
    resources :tasks, only: %i[index create update show edit new]
  end
end
