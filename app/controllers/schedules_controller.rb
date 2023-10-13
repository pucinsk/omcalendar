# frozen_string_literal: true

class SchedulesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.valid?
      @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :description)
  end

  def not_found
    render "errors/404", status: :not_found, layout: nil
  end
end
