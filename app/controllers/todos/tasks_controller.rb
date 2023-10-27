# frozen_string_literal: true

module Todos
  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end

    def create
      task = Task.new(task_params)

      if task.save
        redirect_to root_path, notice: "It worked"
      else
        render :index, notice: ":("
      end
    end

    def update
      task = Task.find(params[:id])

      if task.update(task_params)
        redirect_to root_path, notice: "It worked"
      else
        render :index, notice: ":("
      end
    end

    private

    def task_params
      params.require(:todos_task).permit(:title, :state)
    end
  end
end
