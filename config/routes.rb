# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "todos/tasks#index"
end
