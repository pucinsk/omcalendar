# frozen_string_literal: true

module Todos
  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
  end
end
