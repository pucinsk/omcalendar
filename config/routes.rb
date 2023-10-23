# frozen_string_literal: true

Rails.application.routes.draw do
  root "schedules#index"

  resources :schedules, only: %i[index new edit show create update] do
    resources :tasks, only: %i[new create show]
  end
end
