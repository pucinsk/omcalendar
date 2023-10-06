# frozen_string_literal: true

Rails.application.routes.draw do
  root "schedules#index"

  resources :schedules, only: :show do
    resources :tasks, only: %i[new create show]
  end
end
