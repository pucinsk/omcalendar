# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "todos/tasks#index"

  namespace :todos do
    resources :tasks, only: %i[index create update show]
  end
end
