# frozen_string_literal: true

Rails.application.routes.draw do
  root "schedules#index"
  resources :schedules, only: :show
end
