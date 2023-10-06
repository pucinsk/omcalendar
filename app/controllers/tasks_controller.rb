# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_schedule, only: %i[new create]

  def new
    @task = @schedule.tasks.new
  end

  def create
    @task = @schedule.tasks.new(task_params)

    if @task.valid?
      @task.save
      redirect_to schedule_path(@schedule)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
