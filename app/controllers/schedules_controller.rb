# frozen_string_literal: true

class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @schedules = Schedule.all
  end

  def show; end

  def new
    @schedule = Schedule.new
  end

  def edit; end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.valid?
      @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :description)
  end

  def not_found
    render "errors/404", status: :not_found, layout: nil
  end
end
